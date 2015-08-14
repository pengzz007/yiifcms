<?php
/**
 * 文章批量操作
 * 
 * @author        Sim Zhao <326196998@qq.com>
 * @copyright     Copyright (c) 2015. All rights reserved.
 */

class BatchAction extends CAction
{	
	public function run(){
		if ( $this->method() == 'GET' ) {
            $command = trim( $_GET['command'] );
            $ids = intval( $_GET['id'] );
        } elseif ( $this->method() == 'POST' ) {
            $command = trim( $_POST['command'] );
            $ids = $_POST['id'];
        } else {
            $this->message( 'errorBack', Yii::t('admin','Only POST Or GET') );
        }
        empty( $ids ) && $this->message( 'error', Yii::t('admin','No Select') );

        switch ( $command ) {
        case 'delete':      
        	//删除文章     
        	foreach((array)$ids as $id){
        		$postModel = Post::model()->findByPk($id);
        		if($postModel){
        			$image_list = $postModel->image_list;
        			$image_list && $image_list = unserialize($image_list);
        			if($image_list){
        				foreach($image_list as $image){
        					Uploader::deleteFile($image['file']);
        					$file = Upload::model()->findByPk($image['fileId']);
        					if($file){
        						$file->delete();
        					}
        				}
        			}
        			
        			Uploader::deleteFile($postModel->attach_file);
        			Uploader::deleteFile($postModel->attach_thumb);
        			
        			$postModel->delete();
        			
        			//删除关联的标签
        			TagData::model()->deleteAll('content_id =:id AND type =:type', array(':id'=>$id, ':type'=>$this->_type_ids['post']));
        		}
        	}
            break;       
        case 'show':     
        	//文章显示      
        	foreach((array)$ids as $id){
        		$postModel = Post::model()->findByPk($id);        		
        		if($postModel){
        			$postModel->status = 'Y';
        			$postModel->save();
        			//更新关联的标签
        			$tagData = TagData::model()->updateAll(array('status'=>'Y'),'content_id =:id AND type =:type', array(':id'=>$id, ':type'=>$this->_type_ids['post']));
        		}
            }
            break;
        case 'hidden':     
        	//文章隐藏      
        	foreach((array)$ids as $id){
        		$postModel = Post::model()->findByPk($id);        		
        		if($postModel){
        			$postModel->status = 'N';
        			$postModel->save();
        			//更新关联的标签
        			$tagData = TagData::model()->updateAll(array('status'=>'N'),'content_id =:id AND type =:type', array(':id'=>$id, ':type'=>$this->_type_ids['post']));
        		}
            }
            break;
        case 'commend':     
        	//文章推荐
        	foreach((array)$ids as $id){        		
        		$recom_id = intval($_POST['recom_id']);
        		if($recom_id){
        			$postModel = Post::model()->findByPk($id);
	        		if($postModel){
	        			$postModel->commend = 'Y';
	        			$postModel->save();
	        			$recom_post = new RecommendPost();
	        			$recom_post->id = $recom_id;
	        			$recom_post->post_id = $id;
	        			$recom_post->save();
	        		}
        		}else{
        			$this->message('error', Yii::t('admin','RecommendPosition is Required'));
        		}
        	}                 
            break;
		
		case 'stick':     
        	//文章置顶      
        	foreach((array)$ids as $id){
        		$postModel = Post::model()->findByPk($id);        		
        		if($postModel){
        			$postModel->top_line = 'Y';
        			$postModel->save();
        		}
            }
            break;
        case 'cancelStick':     
        	//文章取消置顶      
        	foreach((array)$ids as $id){
        		$postModel = Post::model()->findByPk($id);        		
        		if($postModel){
        			$postModel->top_line = 'N';
        			$postModel->save();
        		}
            }
            break;
         default:
            throw new CHttpException(404, Yii::t('admin','Error Operation'));
            break;
        }
        $this->message('success', Yii::t('admin','Batch Operate Success'));    	
	}
}