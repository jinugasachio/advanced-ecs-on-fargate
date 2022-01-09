# 親ディレクトリに存在するterragrunt.hcl を探しその設定を継承
include "root" {
  path = find_in_parent_folders()
}