require File.expand_path(File.join(File.dirname(__FILE__), '../spec_helper'))
require File.expand_path(File.join(File.dirname(__FILE__), '../app'))

describe Assistant do
  describe "with previous instantiated records" do
    before(:each) do
      Assistant.create!(:name => "Maran")

      @author = Author.create!
      @assistant = @author.assistants.create!(:name => "Jeroen")
      
      @p1, @p2, @p3 = (1..3).map { @author.posts.create! }
    end
    
    it "should return the correct author" do
      @assistant.author.should == @author
    end
    
    it "should belong to the correct author" do
      @author.assistants.should == [@assistant]
    end

    it "should return correct number of posts" do
      @assistant.posts.size.should == 3
    end

    it "should return the same posts as its author" do
      @assistant.posts.should == @author.posts
    end

    it "should return the posts in the same order " do
      @assistant.posts.should == [@p1, @p2, @p3]
    end
  end

end