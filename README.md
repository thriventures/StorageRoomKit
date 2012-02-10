StorageRoomKit
==============================

StorageRoomKit is a static library (iOS) and framework (OS X) that provides helper methods and classes to make it easier to use RestKit (http://restkit.org + https://github.com/restkit/restkit) with the StorageRoom API (http://storageroomapp.com).

This library has been tested with Xcode 4.2, older versions of Xcode are not supported.

Main Features
------------------------------

* Works with NSObjects and NSManagedObjects
* Supports the GET, POST, PUT and DELETE HTTP methods
* Comes with classes and mappings for all StorageRoom Resources
* Helper methods to generate StorageRoom paths
* ... and many more handy features that RestKit offers


Installation into your Project
------------------------------

1. Add RestKit to your project by following the detailed installation instructions:
  * https://github.com/RestKit/RestKit/blob/master/README.md
  * https://github.com/RestKit/RestKit/wiki/Installing-RestKit-in-Xcode-4.x
  * The latest RestKit version that was tested with StorageRoomKit is c19a500ca8145295e0a518019c036e585dc42094. Newer versions might work, but don't have to.
1. Add StorageRoomKit to your project
  1. Add a new git submodule: `git submodule add git://github.com/thriventures/StorageRoomKit.git StorageRoomKit`
  
      * Please note that RestKit and StorageRoomKit **must be siblings** in the directory structure of your project! You can add both submodules to the base directory or to a common subdirectory (e.g. Vendor/RestKit and Vendor/StorageRoomKit).
    
  1. Add a cross-project reference by dragging **StorageRoomKit.xcodeproj** to your own project
  1. Open build settings editor for your project and the following **Header Search Paths** for the paths you used above, otherwise archiving will fail:

      * `"$(SOURCE_ROOT)/RestKit/Build"`
      * `"$(SOURCE_ROOT)/StorageRoomKit/Build"`

  1. Open target settings editor for the target you want to link StorageRoomKit into and add direct dependencies:
  
      * StorageRoomKit (iOS)
      * StorageRoomKitFramework (Mac OS X)
      
  1. Link against the library:
  
      * **libStorageRoomKit.a** (iOS)
      * **StorageRoomKitFramework.framework** (Mac OS X)
      
  1. Import the StorageRoomKit headers
  
      * `#import <StorageRoomKit/StorageRoomKit.h>`
      
  1. Build the project to verify installation is successful.


Basic Usage
------------------------------


This is a walkthrough with all steps for a simple usage scenario of the library.

1. Import the headers

        #import <RestKit/RestKit.h>
        #import <StorageRoomKit/StorageRoomKit.h>

1. Add the SREntry protocol to your custom class

        @interface Announcement : NSObject <SREntry> {

        }

        @property (nonatomic, retain) NSString * text;
        @property (nonatomic, retain) NSString * mUrl;

        @end

1. Implement the SREntry protocol methods

        + (RKObjectMapping *)objectMapping {
            RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[self class]];

            [mapping mapSRAttributes:@"text", nil];
            [mapping mapSRMetaData:@"url", nil]; // will map to mUrl

            return mapping;
        }

        + (NSString *)entryType {
            return @"Announcement";
        }

1. Create the ObjectManager

        [SRObjectManager objectManagerForAccountId:@"STORAGE_ROOM_ACCOUNT_ID" authenticationToken:@"AUTHENTICATION_TOKEN"];

1. Work with API Resources

        [[RKObjectManager sharedManager] loadObjectsAtResourcePath:SRCollectionEntriesPath(@"COLLECTION_ID") delegate:self];    

1. Do something with the returned object(s) in the delegate

        - (void)objectLoader:(RKObjectLoader *)anObjectLoader didLoadObject:(Announcement *)anAnnouncement {
            self.announcementLabel.text = anAnnouncement.text;
        }


Meta Data
------------------------------

The JSON representations of Resources in the StorageRoom API contain meta data attributes that are prefixed with an "@" character. An example for this is the 
"@created_at" meta data attribute, which shows the time at which a Resource was created on the server.

RestKit relies heavily on Key-Value Coding (KVC), but "@" is an invalid character in KVC. The StorageRoom API therefore allows to change the prefix used for 
meta data. StorageRoomKit changes this prefix for you from "@" to "m_". In the internal classes used by StorageRoom meta data attributes are mapped to an
instance variable with the "m" prefix (e.g. "m_created_at" will be mapped to "mCreatedAt"). You can follow this convention in your own Entry classes,
but you are not required to.

Documentation
------------------------------

The StorageRoom API Documentation (http://storageroomapp.com/documentation) contains further information about the web service.

An **Example Project** on how to use StorageRoomKit is available at http://github.com/thriventures/StorageRoomCatalog.


StorageRoom without StorageRoomKit
------------------------------

If you just need a small amount of content in your app and think this library is to heavy-weight you can also parse the JSON manually without StorageRoomKit. An example for this is on https://github.com/thriventures/simple_iphone_example.



Running Specs
------------------------------

StorageRoomKit comes with Kiwi Specs. Run the Specs with Product > Test.


TODO
------------------------------

Please refer to TODO file.


Bugs and Feedback
------------------------------

Please create an issue on GitHub if you discover any bugs.

http://github.com/thriventures/StorageRoomKit/issues

License
------------------------------

MIT License. Copyright 2012 Thriventures UG (haftungsbeschränkt) - http://www.thriventures.com