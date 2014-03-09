SocialiteServer::Application.routes.draw do
  
  get 'twitter/:twitter_query' => "tweets#index"
  get 'instagram/:instagram_query' => "instagrams#index"
  
end