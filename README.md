# zarf-skeleton-test

create zarf package

```console
# cd scripts-example/zarf-package-example
# zarf package create . --confirm

 NOTE  Using build directory .
                                                                                                      
  📦 PACKAGE DEFINITION                                                                               
                                                                                                      
kind: ZarfPackageConfig

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
metadata:  information about this package

  name: scripts-package-example
  description: Zarf Scripts Pacakage Example
  version: 0.1.0
  architecture: amd64

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
components:  definition of capabilities this package deploys

- name: prepare-scripts
  required: true
  files:
  - source: ../scripts/
    target: run/scripts/
  actions:
    onCreate:
      before:
      - dir: ../scripts
        cmd: pwd &&  echo '3' > test3.txt
      after:
      - dir: ../scripts
        cmd: rm test3.txt

- name: execute-scripts
  required: true
  actions:
    onDeploy:
      before:
      - dir: run/scripts/
        cmd: pwd && bash ./test.sh
      after:
      - cmd: rm -r run

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  ✔  Create Zarf package confirmed

                                                                                                      
  📦 PREPARE-SCRIPTS COMPONENT                                                                        
                                                                                                      

     /home/palassis/GITHUB/MxNxPx/zarf-skeleton-test/scripts-example/scripts                                                                                                                                                                                                                                     
  ✔  Completed "pwd &&  echo '3' > test3.txt"                                                                                                                                                                                                                                                                    
  ✔  Completed "rm test3.txt"                                                                                                                                                                                                                                                                                    

                                                                                                      
  📦 EXECUTE-SCRIPTS COMPONENT                                                                        
                                                                                                      

  ✔  Creating SBOMs for 0 images and 1 components with files.                                                                                                                                                                                                                                                    
  ✔  Package tarball successfully written                                                                                                                                                                                                                                                                        
```

deploy zarf package

```console
# zarf package deploy zarf-package-*.zst --confirm

  ✔  Checksums validated!                                                                                                                                                                                                                                                                                        
  ✔  Loading Zarf Package zarf-package-scripts-package-example-amd64-0.1.0.tar.zst                                                                                                                                                                                                                               
 WARNING  Unable to validate package architecture: unable to get the configured cluster's
          architecture
                                                                                                      
  📦 PACKAGE DEFINITION                                                                               
                                                                                                      
kind: ZarfPackageConfig

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
metadata:  information about this package

  name: scripts-package-example
  description: Zarf Scripts Pacakage Example
  version: 0.1.0
  architecture: amd64
  aggregateChecksum: 81cf6eb73c5daa2e39ae8bcf5d38a0e1d1248f2840c863cd253fad1c898ee33e

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
build:  info about the machine, zarf version, and user that created this package

  terminal: palassis-razer
  user: palassis
  architecture: amd64
  timestamp: Sat, 05 Aug 2023 13:56:08 -0400
  version: v0.28.2
  migrations:
  - scripts-to-actions
  - pluralize-set-variable
  differential: false
  registryOverrides: {}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
components:  definition of capabilities this package deploys

- name: prepare-scripts
  required: true
  files:
  - source: ../scripts/
    target: run/scripts/
  actions:
    onCreate:
      before:
      - dir: ../scripts
        cmd: pwd &&  echo '3' > test3.txt
      after:
      - dir: ../scripts
        cmd: rm test3.txt

- name: execute-scripts
  required: true
  actions:
    onDeploy:
      before:
      - dir: run/scripts/
        cmd: pwd && bash ./test.sh
      after:
      - cmd: rm -r run

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 Software Bill of Materials   an inventory of all software contained in this package

 NOTE  This package has 1 artifact to be reviewed. This is available in a temporary
       'zarf-sbom' folder in this directory and will be removed upon deployment.

- View SBOMs now by navigating to the 'zarf-sbom' folder or copying this link into a browser:
/home/palassis/GITHUB/MxNxPx/zarf-skeleton-test/scripts-example/zarf-package-example/zarf-sbom/sbom-viewer-zarf-component-prepare-scripts.html

- View SBOMs after deployment with this command:
$ zarf package inspect zarf-package-scripts-package-example-amd64-0.1.0.tar.zst

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  ✔  Deploy Zarf package confirmed

  📦 PREPARE-SCRIPTS COMPONENT                                                                        
                                                                                                      
  ✔  Copying 1 files                                                                                                                                                                                                                                                                                             

  📦 EXECUTE-SCRIPTS COMPONENT                                                                        

     /home/palassis/GITHUB/MxNxPx/zarf-skeleton-test/scripts-example/zarf-package-example/run/scripts                                                                                                                                                                                                            
     test1.txt exists                                                                                                                                                                                                                                                                                            
     test2.txt exists                                                                                                                                                                                                                                                                                            
     test3.txt exists                                                                                                                                                                                                                                                                                            
  ✔  Completed "pwd && bash ./test.sh"                                                                                                                                                                                                                                                                           
  ✔  Completed "rm -r run"                                                                                                                                                                                                                                                                                       
  ✔  Zarf deployment complete
```

publish zarf skeleton

```console
# zarf package publish . oci://ghcr.io/mxnxpx/packages
                                                                                                      
  📦 PREPARE-SCRIPTS COMPONENT                                                                        
                                                                                                      
  📦 EXECUTE-SCRIPTS COMPONENT                                                                        

  ✔  Checksums validated!                                                                                                                                                                                                                                                                                        
                                                                                                      
  📦 PACKAGE PUBLISH scripts-package-example:ghcr.io/mxnxpx/packages/scripts-package-example:0.1....  

  •  Publishing package to ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton
  ✔  Prepared 3 layers                                                                                                                                                                                                                                                                                           
  ✔  7e0c4655f3af [application/vnd.oci.image.config.v1+json]                                                                                                                                                                                                                                                     
  ✔  3e8e5ab805ff components/prepare-scripts.tar                                                                                                                                                                                                                                                                 
  ✔  2cacb563df95 checksums.txt                                                                                                                                                                                                                                                                                  
  ✔  4aaa25b8c850 zarf.yaml                                                                                                                                                                                                                                                                                      
  ✔  9e263f1357f0 [application/vnd.oci.image.manifest.v1+json]                                                                                                                                                                                                                                                   
  ✔  Published ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton [application/vnd.oci.image.manifest.v1+json]                                                                                                                                                                                       

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 How to import components from this skeleton:   

- name: import-prepare-scripts
  import:
    name: prepare-scripts
    url: oci://ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton

- name: import-execute-scripts
  import:
    name: execute-scripts
    url: oci://ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton
```

create package from skeleton

```console
# cd ../zarf-skeleton-example
# zarf package create . --confirm -l debug

  DEBUG   2023-08-05T14:02:33-04:00  -  Log level set to debug

  DEBUG   2023-08-05T14:02:33-04:00  -  packager.createPaths()
  DEBUG   2023-08-05T14:02:33-04:00  -  Using temp path: '/tmp/zarf-3807491006'
  DEBUG   2023-08-05T14:02:33-04:00  -  Loading zarf config zarf.yaml

 NOTE  Using build directory .
  DEBUG   2023-08-05T14:02:33-04:00  -  packager.ComposeComponents()
  DEBUG   2023-08-05T14:02:33-04:00  -  packager.GetComposedComponent({Name:import-prepare-scripts Description: Default:false Required:false Only:{LocalOS: Cluster:{Architecture: Distros:[]}} Group: CosignKeyPath: Import:{ComponentName:prepare-scripts Path: URL:oci://ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton} DeprecatedScripts:{ShowOutput:false TimeoutSeconds:0 Retry:false Prepare:[] Before:[] After:[]} Files:[] Charts:[] Manifests:[] Images:[] Repos:[] DataInjections:[] Extensions:{BigBang:<nil>} Actions:{OnCreate:{Defaults:{Mute:false MaxTotalSeconds:0 MaxRetries:0 Dir: Env:[] Shell:{Windows: Linux: Darwin:}} Before:[] After:[] OnSuccess:[] OnFailure:[]} OnDeploy:{Defaults:{Mute:false MaxTotalSeconds:0 MaxRetries:0 Dir: Env:[] Shell:{Windows: Linux: Darwin:}} Before:[] After:[] OnSuccess:[] OnFailure:[]} OnRemove:{Defaults:{Mute:false MaxTotalSeconds:0 MaxRetries:0 Dir: Env:[] Shell:{Windows: Linux: Darwin:}} Before:[] After:[] OnSuccess:[] OnFailure:[]}}})
  DEBUG   2023-08-05T14:02:33-04:00  -  packager.getChildComponent({Name:import-prepare-scripts Description: Default:false Required:false Only:{LocalOS: Cluster:{Architecture: Distros:[]}} Group: CosignKeyPath: Import:{ComponentName:prepare-scripts Path: URL:oci://ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton} DeprecatedScripts:{ShowOutput:false TimeoutSeconds:0 Retry:false Prepare:[] Before:[] After:[]} Files:[] Charts:[] Manifests:[] Images:[] Repos:[] DataInjections:[] Extensions:{BigBang:<nil>} Actions:{OnCreate:{Defaults:{Mute:false MaxTotalSeconds:0 MaxRetries:0 Dir: Env:[] Shell:{Windows: Linux: Darwin:}} Before:[] After:[] OnSuccess:[] OnFailure:[]} OnDeploy:{Defaults:{Mute:false MaxTotalSeconds:0 MaxRetries:0 Dir: Env:[] Shell:{Windows: Linux: Darwin:}} Before:[] After:[] OnSuccess:[] OnFailure:[]} OnRemove:{Defaults:{Mute:false MaxTotalSeconds:0 MaxRetries:0 Dir: Env:[] Shell:{Windows: Linux: Darwin:}} Before:[] After:[] OnSuccess:[] OnFailure:[]}}}, )
  DEBUG   2023-08-05T14:02:33-04:00  -  Loading docker config file from default config location: /home/palassis/.docker

  DEBUG   2023-08-05T14:02:34-04:00  -  Pulling ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton
  •  Pulling Zarf package from ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton
  ✔  7e0c4655f3af [application/vnd.oci.image.config.v1+json]                                                                                                                                                                                                                                                     
  ✔  2cacb563df95 checksums.txt                                                                                                                                                                                                                                                                                  
  ✔  3e8e5ab805ff components/prepare-scripts.tar                                                                                                                                                                                                                                                                 
  ✔  4aaa25b8c850 zarf.yaml                                                                                                                                                                                                                                                                                      
  ✔  9e263f1357f0 [application/vnd.oci.image.manifest.v1+json]                                                                                                                                                                                                                                                   
  ✔  Pulling Zarf package data (7.38 KBs)                                                                                                                                                                                                                                                                        
  DEBUG   2023-08-05T14:02:36-04:00  -  Pulled ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton
  ✔  Pulled ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton
  DEBUG   2023-08-05T14:02:36-04:00  -  packager.getSubPackage(../../../../../.zarf-cache/oci/ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton)
  DEBUG   2023-08-05T14:02:36-04:00  -  Loading zarf config ../../../../../.zarf-cache/oci/ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton/zarf.yaml
  DEBUG   2023-08-05T14:02:36-04:00  -  Validating checksums for a subset of files in the package - [components/prepare-scripts.tar zarf.yaml checksums.txt]                                                                                                                                                     
  ⠋  Validating checksum of components/prepare-scripts.tar                                                                                                                                                                                                                                                       
  DEBUG   2023-08-05T14:02:36-04:00  -  packager.fixComposedFilepaths(../../../../../.zarf-cache/oci/ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton/components/prepare-scripts, {Name:prepare-scripts Description: Default:false Required:true Only:{LocalOS: Cluster:{Architecture: Distros:[]}} Group: CosignKeyPath: Import:{ComponentName: Path: URL:} DeprecatedScripts:{ShowOutput:false TimeoutSeconds:0 Retry:false Prepare:[] Before:[] After:[]} Files:[{Source:files/0/scripts Shasum: Target:run/scripts/ Executable:false Symlinks:[]}] Charts:[] Manifests:[] Images:[] Repos:[] DataInjections:[] Extensions:{BigBang:<nil>} Actions:{OnCreate:{Defaults:{Mute:false MaxTotalSeconds:0 MaxRetries:0 Dir: Env:[] Shell:{Windows: Linux: Darwin:}} Before:[{Mute:<nil> MaxTotalSeconds:<nil> MaxRetries:<nil> Dir:0xc001f16990 Env:[] Cmd:pwd &&  echo '3' > test3.txt Shell:<nil> DeprecatedSetVariable: SetVariables:[] Description: Wait:<nil>}] After:[{Mute:<nil> MaxTotalSeconds:<nil> MaxRetries:<nil> Dir:0xc001f169f0 Env:[] Cmd:rm test3.txt Shell:<nil> DeprecatedSetVariable: SetVariables:[] Description: Wait:<nil>}] OnSuccess:[] OnFailure:[]} OnDeploy:{Defaults:{Mute:false MaxTotalSeconds:0 MaxRetries:0 Dir: Env:[] Shell:{Windows: Linux: Darwin:}} Before:[] After:[] OnSuccess:[] OnFailure:[]} OnRemove:{Defaults:{Mute:false MaxTotalSeconds:0 MaxRetries:0 Dir: Env:[] Shell:{Windows: Linux: Darwin:}} Before:[] After:[] OnSuccess:[] OnFailure:[]}}})
  DEBUG   2023-08-05T14:02:36-04:00  -  packager.getComposedFilePath(../../../../../.zarf-cache/oci/ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton/components/prepare-scripts, files/0/scripts)
  DEBUG   2023-08-05T14:02:36-04:00  -  packager.getComposedFilePath(../../../../../.zarf-cache/oci/ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton/components/prepare-scripts, ../scripts)
  DEBUG   2023-08-05T14:02:36-04:00  -  packager.getComposedFilePath(../../../../../.zarf-cache/oci/ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton/components/prepare-scripts, ../scripts)
  DEBUG   2023-08-05T14:02:36-04:00  -  packager.getComposedFilePath(../../../../../.zarf-cache/oci/ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton/components/prepare-scripts, )
  DEBUG   2023-08-05T14:02:36-04:00  -  packager.composeExtentions()
  DEBUG   2023-08-05T14:02:36-04:00  -  packager.mergeComponentOverrides(&{Name:prepare-scripts Description: Default:false Required:true Only:{LocalOS: Cluster:{Architecture: Distros:[]}} Group: CosignKeyPath: Import:{ComponentName: Path: URL:} DeprecatedScripts:{ShowOutput:false TimeoutSeconds:0 Retry:false Prepare:[] Before:[] After:[]} Files:[{Source:../../../../../.zarf-cache/oci/ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton/components/prepare-scripts/files/0/scripts Shasum: Target:run/scripts/ Executable:false Symlinks:[]}] Charts:[] Manifests:[] Images:[] Repos:[] DataInjections:[] Extensions:{BigBang:<nil>} Actions:{OnCreate:{Defaults:{Mute:false MaxTotalSeconds:0 MaxRetries:0 Dir:../../../../../.zarf-cache/oci/ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton/components/prepare-scripts Env:[] Shell:{Windows: Linux: Darwin:}} Before:[{Mute:<nil> MaxTotalSeconds:<nil> MaxRetries:<nil> Dir:0xc001f17b00 Env:[] Cmd:pwd &&  echo '3' > test3.txt Shell:<nil> DeprecatedSetVariable: SetVariables:[] Description: Wait:<nil>}] After:[{Mute:<nil> MaxTotalSeconds:<nil> MaxRetries:<nil> Dir:0xc001f17ed0 Env:[] Cmd:rm test3.txt Shell:<nil> DeprecatedSetVariable: SetVariables:[] Description: Wait:<nil>}] OnSuccess:[] OnFailure:[]} OnDeploy:{Defaults:{Mute:false MaxTotalSeconds:0 MaxRetries:0 Dir: Env:[] Shell:{Windows: Linux: Darwin:}} Before:[] After:[] OnSuccess:[] OnFailure:[]} OnRemove:{Defaults:{Mute:false MaxTotalSeconds:0 MaxRetries:0 Dir: Env:[] Shell:{Windows: Linux: Darwin:}} Before:[] After:[] OnSuccess:[] OnFailure:[]}}}, {Name:import-prepare-scripts Description: Default:false Required:false Only:{LocalOS: Cluster:{Architecture: Distros:[]}} Group: CosignKeyPath: Import:{ComponentName:prepare-scripts Path: URL:oci://ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton} DeprecatedScripts:{ShowOutput:false TimeoutSeconds:0 Retry:false Prepare:[] Before:[] After:[]} Files:[] Charts:[] Manifests:[] Images:[] Repos:[] DataInjections:[] Extensions:{BigBang:<nil>} Actions:{OnCreate:{Defaults:{Mute:false MaxTotalSeconds:0 MaxRetries:0 Dir: Env:[] Shell:{Windows: Linux: Darwin:}} Before:[] After:[] OnSuccess:[] OnFailure:[]} OnDeploy:{Defaults:{Mute:false MaxTotalSeconds:0 MaxRetries:0 Dir: Env:[] Shell:{Windows: Linux: Darwin:}} Before:[] After:[] OnSuccess:[] OnFailure:[]} OnRemove:{Defaults:{Mute:false MaxTotalSeconds:0 MaxRetries:0 Dir: Env:[] Shell:{Windows: Linux: Darwin:}} Before:[] After:[] OnSuccess:[] OnFailure:[]}}})
  DEBUG   2023-08-05T14:02:36-04:00  -  packager.GetComposedComponent({Name:import-execute-scripts Description: Default:false Required:false Only:{LocalOS: Cluster:{Architecture: Distros:[]}} Group: CosignKeyPath: Import:{ComponentName:execute-scripts Path: URL:oci://ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton} DeprecatedScripts:{ShowOutput:false TimeoutSeconds:0 Retry:false Prepare:[] Before:[] After:[]} Files:[] Charts:[] Manifests:[] Images:[] Repos:[] DataInjections:[] Extensions:{BigBang:<nil>} Actions:{OnCreate:{Defaults:{Mute:false MaxTotalSeconds:0 MaxRetries:0 Dir: Env:[] Shell:{Windows: Linux: Darwin:}} Before:[] After:[] OnSuccess:[] OnFailure:[]} OnDeploy:{Defaults:{Mute:false MaxTotalSeconds:0 MaxRetries:0 Dir: Env:[] Shell:{Windows: Linux: Darwin:}} Before:[] After:[] OnSuccess:[] OnFailure:[]} OnRemove:{Defaults:{Mute:false MaxTotalSeconds:0 MaxRetries:0 Dir: Env:[] Shell:{Windows: Linux: Darwin:}} Before:[] After:[] OnSuccess:[] OnFailure:[]}}})
  DEBUG   2023-08-05T14:02:36-04:00  -  packager.getChildComponent({Name:import-execute-scripts Description: Default:false Required:false Only:{LocalOS: Cluster:{Architecture: Distros:[]}} Group: CosignKeyPath: Import:{ComponentName:execute-scripts Path: URL:oci://ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton} DeprecatedScripts:{ShowOutput:false TimeoutSeconds:0 Retry:false Prepare:[] Before:[] After:[]} Files:[] Charts:[] Manifests:[] Images:[] Repos:[] DataInjections:[] Extensions:{BigBang:<nil>} Actions:{OnCreate:{Defaults:{Mute:false MaxTotalSeconds:0 MaxRetries:0 Dir: Env:[] Shell:{Windows: Linux: Darwin:}} Before:[] After:[] OnSuccess:[] OnFailure:[]} OnDeploy:{Defaults:{Mute:false MaxTotalSeconds:0 MaxRetries:0 Dir: Env:[] Shell:{Windows: Linux: Darwin:}} Before:[] After:[] OnSuccess:[] OnFailure:[]} OnRemove:{Defaults:{Mute:false MaxTotalSeconds:0 MaxRetries:0 Dir: Env:[] Shell:{Windows: Linux: Darwin:}} Before:[] After:[] OnSuccess:[] OnFailure:[]}}}, )
  DEBUG   2023-08-05T14:02:36-04:00  -  Loading docker config file from default config location: /home/palassis/.docker

  DEBUG   2023-08-05T14:02:36-04:00  -  Pulling ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton
  •  Pulling Zarf package from ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton
  ✔  7e0c4655f3af [application/vnd.oci.image.config.v1+json]                                                                                                                                                                                                                                                     
  ✔  2cacb563df95 checksums.txt                                                                                                                                                                                                                                                                                  
  ✔  4aaa25b8c850 zarf.yaml                                                                                                                                                                                                                                                                                      
  ✔  9e263f1357f0 [application/vnd.oci.image.manifest.v1+json]                                                                                                                                                                                                                                                   
  ✔  Pulling Zarf package data (1.23 KBs)                                                                                                                                                                                                                                                                        
  DEBUG   2023-08-05T14:02:37-04:00  -  Pulled ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton
  ✔  Pulled ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton
  DEBUG   2023-08-05T14:02:37-04:00  -  packager.getSubPackage(../../../../../.zarf-cache/oci/ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton)
  DEBUG   2023-08-05T14:02:37-04:00  -  Loading zarf config ../../../../../.zarf-cache/oci/ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton/zarf.yaml
  DEBUG   2023-08-05T14:02:37-04:00  -  Validating checksums for a subset of files in the package - [zarf.yaml checksums.txt]                                                                                                                                                                                    
  ⠋  Validating checksum of components/prepare-scripts.tar                                                                                                                                                                                                                                                       
  DEBUG   2023-08-05T14:02:37-04:00  -  packager.fixComposedFilepaths(../../../../../.zarf-cache/oci/ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton/components/execute-scripts, {Name:execute-scripts Description: Default:false Required:true Only:{LocalOS: Cluster:{Architecture: Distros:[]}} Group: CosignKeyPath: Import:{ComponentName: Path: URL:} DeprecatedScripts:{ShowOutput:false TimeoutSeconds:0 Retry:false Prepare:[] Before:[] After:[]} Files:[] Charts:[] Manifests:[] Images:[] Repos:[] DataInjections:[] Extensions:{BigBang:<nil>} Actions:{OnCreate:{Defaults:{Mute:false MaxTotalSeconds:0 MaxRetries:0 Dir: Env:[] Shell:{Windows: Linux: Darwin:}} Before:[] After:[] OnSuccess:[] OnFailure:[]} OnDeploy:{Defaults:{Mute:false MaxTotalSeconds:0 MaxRetries:0 Dir: Env:[] Shell:{Windows: Linux: Darwin:}} Before:[{Mute:<nil> MaxTotalSeconds:<nil> MaxRetries:<nil> Dir:0xc002070010 Env:[] Cmd:pwd && bash ./test.sh Shell:<nil> DeprecatedSetVariable: SetVariables:[] Description: Wait:<nil>}] After:[{Mute:<nil> MaxTotalSeconds:<nil> MaxRetries:<nil> Dir:<nil> Env:[] Cmd:rm -r run Shell:<nil> DeprecatedSetVariable: SetVariables:[] Description: Wait:<nil>}] OnSuccess:[] OnFailure:[]} OnRemove:{Defaults:{Mute:false MaxTotalSeconds:0 MaxRetries:0 Dir: Env:[] Shell:{Windows: Linux: Darwin:}} Before:[] After:[] OnSuccess:[] OnFailure:[]}}})
  DEBUG   2023-08-05T14:02:37-04:00  -  packager.composeExtentions()
  DEBUG   2023-08-05T14:02:37-04:00  -  packager.mergeComponentOverrides(&{Name:execute-scripts Description: Default:false Required:true Only:{LocalOS: Cluster:{Architecture: Distros:[]}} Group: CosignKeyPath: Import:{ComponentName: Path: URL:} DeprecatedScripts:{ShowOutput:false TimeoutSeconds:0 Retry:false Prepare:[] Before:[] After:[]} Files:[] Charts:[] Manifests:[] Images:[] Repos:[] DataInjections:[] Extensions:{BigBang:<nil>} Actions:{OnCreate:{Defaults:{Mute:false MaxTotalSeconds:0 MaxRetries:0 Dir: Env:[] Shell:{Windows: Linux: Darwin:}} Before:[] After:[] OnSuccess:[] OnFailure:[]} OnDeploy:{Defaults:{Mute:false MaxTotalSeconds:0 MaxRetries:0 Dir: Env:[] Shell:{Windows: Linux: Darwin:}} Before:[{Mute:<nil> MaxTotalSeconds:<nil> MaxRetries:<nil> Dir:0xc002070010 Env:[] Cmd:pwd && bash ./test.sh Shell:<nil> DeprecatedSetVariable: SetVariables:[] Description: Wait:<nil>}] After:[{Mute:<nil> MaxTotalSeconds:<nil> MaxRetries:<nil> Dir:<nil> Env:[] Cmd:rm -r run Shell:<nil> DeprecatedSetVariable: SetVariables:[] Description: Wait:<nil>}] OnSuccess:[] OnFailure:[]} OnRemove:{Defaults:{Mute:false MaxTotalSeconds:0 MaxRetries:0 Dir: Env:[] Shell:{Windows: Linux: Darwin:}} Before:[] After:[] OnSuccess:[] OnFailure:[]}}}, {Name:import-execute-scripts Description: Default:false Required:false Only:{LocalOS: Cluster:{Architecture: Distros:[]}} Group: CosignKeyPath: Import:{ComponentName:execute-scripts Path: URL:oci://ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton} DeprecatedScripts:{ShowOutput:false TimeoutSeconds:0 Retry:false Prepare:[] Before:[] After:[]} Files:[] Charts:[] Manifests:[] Images:[] Repos:[] DataInjections:[] Extensions:{BigBang:<nil>} Actions:{OnCreate:{Defaults:{Mute:false MaxTotalSeconds:0 MaxRetries:0 Dir: Env:[] Shell:{Windows: Linux: Darwin:}} Before:[] After:[] OnSuccess:[] OnFailure:[]} OnDeploy:{Defaults:{Mute:false MaxTotalSeconds:0 MaxRetries:0 Dir: Env:[] Shell:{Windows: Linux: Darwin:}} Before:[] After:[] OnSuccess:[] OnFailure:[]} OnRemove:{Defaults:{Mute:false MaxTotalSeconds:0 MaxRetries:0 Dir: Env:[] Shell:{Windows: Linux: Darwin:}} Before:[] After:[] OnSuccess:[] OnFailure:[]}}})
  DEBUG   2023-08-05T14:02:37-04:00  -  packager.processExtensions()
  DEBUG   2023-08-05T14:02:37-04:00  -  packager.createOrGetComponentPaths({
            "name": "import-prepare-scripts",
            "only": {
              "cluster": {}
            },
            "import": {},
            "scripts": {},
            "files": [
              {
                "source": "../../../../../.zarf-cache/oci/ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton/components/prepare-scripts/files/0/scripts",
                "target": "run/scripts/"
              }
            ],
            "extensions": {},
            "actions": {
              "onCreate": {
                "defaults": {
                  "dir": "../../../../../.zarf-cache/oci/ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton/components/prepare-scripts",
                  "shell": {}
                },
                "before": [
                  {
                    "dir": "../../../../../.zarf-cache/oci/ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton/components/scripts",
                    "cmd": "pwd \u0026\u0026  echo '3' \u003e test3.txt"
                  }
                ],
                "after": [
                  {
                    "dir": "../../../../../.zarf-cache/oci/ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton/components/scripts",
                    "cmd": "rm test3.txt"
                  }
                ]
              },
              "onDeploy": {
                "defaults": {
                  "shell": {}
                }
              },
              "onRemove": {
                "defaults": {
                  "shell": {}
                }
              }
            }
          })
  DEBUG   2023-08-05T14:02:37-04:00  -  packager.createOrGetComponentPaths({
            "name": "import-execute-scripts",
            "only": {
              "cluster": {}
            },
            "import": {},
            "scripts": {},
            "extensions": {},
            "actions": {
              "onCreate": {
                "defaults": {
                  "shell": {}
                }
              },
              "onDeploy": {
                "defaults": {
                  "shell": {}
                },
                "before": [
                  {
                    "dir": "run/scripts/",
                    "cmd": "pwd \u0026\u0026 bash ./test.sh"
                  }
                ],
                "after": [
                  {
                    "cmd": "rm -r run"
                  }
                ]
              },
              "onRemove": {
                "defaults": {
                  "shell": {}
                }
              }
            }
          })
                                                                                                      
  📦 PACKAGE DEFINITION                                                                               
                                                                                                      
kind: ZarfPackageConfig

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
metadata:  information about this package

  name: scripts-skeleton-example
  description: Zarf Scripts Skeleton Example
  version: 0.1.0
  architecture: amd64

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
build:  info about the machine, zarf version, and user that created this package

  terminal: ""
  user: ""
  architecture: ""
  timestamp: ""
  version: ""
  migrations: []
  differential: false
  registryOverrides: {}
  OCIImportedComponents:
    oci://ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton: execute-scripts

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
components:  definition of capabilities this package deploys

- name: import-prepare-scripts
  files:
  - source: ../../../../../.zarf-cache/oci/ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton/components/prepare-scripts/files/0/scripts
    target: run/scripts/
  actions:
    onCreate:
      defaults:
        dir: ../../../../../.zarf-cache/oci/ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton/components/prepare-scripts
      before:
      - dir: ../../../../../.zarf-cache/oci/ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton/components/scripts
        cmd: pwd &&  echo '3' > test3.txt
      after:
      - dir: ../../../../../.zarf-cache/oci/ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton/components/scripts
        cmd: rm test3.txt

- name: import-execute-scripts
  actions:
    onDeploy:
      before:
      - dir: run/scripts/
        cmd: pwd && bash ./test.sh
      after:
      - cmd: rm -r run

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  ✔  Create Zarf package confirmed

  📦 IMPORT-PREPARE-SCRIPTS COMPONENT                                                                 

  DEBUG   2023-08-05T14:02:37-04:00  -  packager.createOrGetComponentPaths({
            "name": "import-prepare-scripts",
            "only": {
              "cluster": {}
            },
            "import": {},
            "scripts": {},
            "files": [
              {
                "source": "../../../../../.zarf-cache/oci/ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton/components/prepare-scripts/files/0/scripts",
                "target": "run/scripts/"
              }
            ],
            "extensions": {},
            "actions": {
              "onCreate": {
                "defaults": {
                  "dir": "../../../../../.zarf-cache/oci/ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton/components/prepare-scripts",
                  "shell": {}
                },
                "before": [
                  {
                    "dir": "../../../../../.zarf-cache/oci/ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton/components/scripts",
                    "cmd": "pwd \u0026\u0026  echo '3' \u003e test3.txt"
                  }
                ],
                "after": [
                  {
                    "dir": "../../../../../.zarf-cache/oci/ghcr.io/mxnxpx/packages/scripts-package-example:0.1.0-skeleton/components/scripts",
                    "cmd": "rm test3.txt"
                  }
                ]
              },
              "onDeploy": {
                "defaults": {
                  "shell": {}
                }
              },
              "onRemove": {
                "defaults": {
                  "shell": {}
                }
              }
            }
          })
  DEBUG   2023-08-05T14:02:37-04:00  -  Running command in sh: pwd &&  echo '3' > test3.txt                                                                                                                                                                                                                      
  DEBUG   2023-08-05T14:02:37-04:00  -  pwd &&  echo '3' > test3.txt                                                                                                                                                                                                                                             
  DEBUG   2023-08-05T14:02:37-04:00  -  unable to add component: unable to run component before action: command "pwd &&  echo '3' > test3.txt" failed after 0 retries                                                                                                                                            
     ERROR:  Failed to create package: unable to add component: unable to run component before action: command                                                                                                                                                                                                   
             "pwd && echo '3' > test3.txt" failed after 0 retries
  DEBUG   2023-08-05T14:02:37-04:00  -  goroutine 1 [running]:                                                                                                                                                                                                                                                   
          runtime/debug.Stack()
          	/opt/hostedtoolcache/go/1.19.10/x64/src/runtime/debug/stack.go:24 +0x65
          github.com/defenseunicorns/zarf/src/pkg/message.Fatal({0x389f9e0?, 0xc000b6dd60?}, {0xc0002fbc20, 0x96})
          	/home/runner/work/zarf/zarf/src/pkg/message/message.go:176 +0x18a
          github.com/defenseunicorns/zarf/src/pkg/message.Fatalf({0x389f9e0, 0xc000b6dd60}, {0x3f13c49?, 0x0?}, {0xc00228fd38?, 0x0?, 0x0?})
          	/home/runner/work/zarf/zarf/src/pkg/message/message.go:183 +0x51
          github.com/defenseunicorns/zarf/src/cmd.glob..func15(0x7b27f80?, {0xc0006b7440?, 0x4?, 0x4?})
          	/home/runner/work/zarf/zarf/src/cmd/package.go:68 +0x271
          github.com/spf13/cobra.(*Command).execute(0x7b27f80, {0xc0006b7400, 0x4, 0x4})
          	/home/runner/go/pkg/mod/github.com/spf13/cobra@v1.7.0/command.go:944 +0x847
          github.com/spf13/cobra.(*Command).ExecuteC(0x7b28de0)
          	/home/runner/go/pkg/mod/github.com/spf13/cobra@v1.7.0/command.go:1068 +0x3bd
          github.com/spf13/cobra.(*Command).Execute(...)
          	/home/runner/go/pkg/mod/github.com/spf13/cobra@v1.7.0/command.go:992
          github.com/defenseunicorns/zarf/src/cmd.Execute()
          	/home/runner/work/zarf/zarf/src/cmd/root.go:70 +0x25
          main.main()
          	/home/runner/work/zarf/zarf/main.go:23 +0x6f
```
