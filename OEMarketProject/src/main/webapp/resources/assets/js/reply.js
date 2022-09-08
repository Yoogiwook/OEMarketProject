console.log('댓글 확인....')

var replyService = ( function() {

    function add(re_reply, callback, error){
        console.log("add re_reply.............");

        $.ajax({
            type : 'post' ,               
            url : '/replies/new',       
            data : JSON.stringify(re_reply),
            contentType : "application/json; charset = utf-8",
            success : function(result, status, xhr){
                if(callback){                  //status: 상태정보, xhr:통신객체 정보(비동기데이터 전송요청) 이 둘은 생략 가능
                    callback(result);
                }
            },
            error : function(xhr, status,err){
                if(error){
                    error(err);
                }
            }
        });
     } // end for add
    
    function getList(param, callback, error){
        var bo_num = param.bo_num;
        var page = param.page || 1;

        $.getJSON("/replies/pages/" + bo_num + "/" + page + ".json" ,
            function(data){
                if(callback) {
                    // callback(data); 댓글 목록만 가져오는 경우 사용
                    callback(data.replyCnt, data.list);
                }

            }).fail(function(xhr, status, err){
                if(error) {
                    error(err);
                }
            });
    } //end for getList

    function remove(re_num, callback, error){
            $.ajax({
                type : 'delete',
                url : '/replies/' + re_num,
                success : function(result, status, xhr){
                    if(callback) callback(result);
                },
                error : function(xhr, status, err){
                    if(error) error(err);
                }
            });
    }  // end for remove

    function update(re_reply, callback, error){
            console.log("update............");

            $.ajax({
                type : 'put',
                url :  '/replies/'  + re_reply.re_num,
                data : JSON.stringify(re_reply),
                contentType : "application/json; charset=utf-8",
                success : function(result, status, xhr){
                    if(callback){
                        callback(result);
                    }
                },
                error : function(xhr, status, err){
                    if(error){
                        error(err);
                    }
                }
            });
    } //end for update

    function get(re_num, callback, error){
        console.log("get............");

        // $.ajax({
        //     type : 'get',
        //     url :  '/replies/get/'  + re_num,
        //     success : function(result, status, xhr){
        //         if(callback){
        //             callback(result);
        //         }
        //     },
        //     error : function( xhr, status, err){
        //         if(error){
        //             error(err);
        //         }
        //     }
        // });
        $.get("/replies/get/" + re_num +  ".json" ,
            function(data){
                if(callback) {
                    callback(data);
                }

            }).fail(function(xhr, status, err){
                if(error) {
                    error(err);
                }
            });
    } // end for get

    function displayTime(timeValue){
        var today = new Date();  // 현재 시간
        // 시간차이 연산
        var gap = today.getTime() - timeValue;
        // 댓글이 등록된 시간을 변수에 할당
        var dateObj = new Date(timeValue);
        var str = "";
        
        if(gap < 60*60*24*1000){ // 시간차이가 24시간 미만이라면,
            var hh = dateObj.getHours();
            var mi = dateObj.getMinutes();
            var ss = dateObj.getSeconds();

			// 배열 요소를 문자열로 변환. join
			// 시간에 포맷을 맞추기 위해서 0 ~ 9까지는 앞에 0을 추가 표시
            return [(hh>9 ? '' : '0' ) + hh,  ' : ', (mi>9? '' : '0')+mi, ' : ' , (ss>9? ' ' : '0')+ss].join(' ');
        }else{
            var yy = dateObj.getFullYear();
            var mm = dateObj.getMonth()+1;
            var dd = dateObj.getDate();

            return [yy , '/' , (mm>9? ' ' : '0') + mm, '/', (dd>9? ' ' : '0')+ dd].join(' ');
        }
    } // end for displayTime
    
    return {  // 함수를 객체로 만들어 리턴한다.
    	add : add,
        getList : getList,
        remove : remove,
        update : update,
        get : get,
        displayTime : displayTime
    };

})();