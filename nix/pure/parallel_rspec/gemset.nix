{
  parallel = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0c719bfgcszqvk9z47w2p8j2wkz5y35k48ywwas5yxbbh3hm3haa";
      type = "gem";
    };
    version = "1.27.0";
  };
  parallel_tests = {
    dependencies = ["parallel"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0rpn88b55q0kf21gxd7x1p5j44fg0fp81w30nfkrch3wl96iwg3q";
      type = "gem";
    };
    version = "5.5.0";
  };
}
