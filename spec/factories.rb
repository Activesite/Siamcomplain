Factory.define :user do |user| 
    user.name "test"
    user.email "test@test.com"
    user.password "testtest"
    user.password_confirmation "testtest"
end

Factory.define :article do |article| 
    article.articleTitle "Saran Yamasathien"
    article.articleContent "pom.saran@gmail.com"
    article.user_id "1"
end