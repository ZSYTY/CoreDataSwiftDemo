# CoreDataSwiftDemo

### [Swift使用CoreData存储数据](https://www.jianshu.com/p/e4c106015005)

之前写过一篇介绍iOS数据存储方法的[文章](https://www.jianshu.com/p/e88880be794f)，包含：FMDB，SQLite3 ，Core Data，Plist，偏好设置，归档。

本文则是介绍Swift中CoreData的基本使用。 

![coredata.gif](http://upload-images.jianshu.io/upload_images/3873004-ad4f079ba055f7db.gif?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)  

## 目录
> 一、 图形化创建模型   
> 二、 手动创建模型并实现AppDelegate中的代码   
> 三、 创建并实现CoreDataManager   

### 一、图形化创建模型(这一小节的内容[我的另一篇文中](https://github.com/remember17/CoreDataSwiftDemo)也有，如已经熟悉，或想要直接手动创建模型，可以直接看第二小节正式进入Swift)
>创建项目的时候，勾选下图中的Use Core Data选项，工程中会自动创建一个数据模型文件。当然，你也可以在开发中自己手动创建。

![自动创建模型文件](http://upload-images.jianshu.io/upload_images/3873004-22674d6bf7b0bd04.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

>下图就是自动创建出来的文件

![创建出来的文件](http://upload-images.jianshu.io/upload_images/3873004-99d5db789d967547.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

>如果没有勾选，也可以在这里手动创建。

![手动创建](http://upload-images.jianshu.io/upload_images/3873004-251764adcf0b0974.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

>点击Add Entity之后，相当一张数据表。表的名称自己在上方定义，注意首字母要大写。
在界面中还可以为数据实体添加属性和关联属性。

![创建一个数据表](http://upload-images.jianshu.io/upload_images/3873004-c1e7ddcc0bc1119c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


>Core Data属性支持的数据类型如下

![数据类型](http://upload-images.jianshu.io/upload_images/3873004-79805e0cf409be6d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

>编译之后，Xcode会自动生成Person的实体代码文件，并且文件不会显示在工程中，如果下图中右侧Codegen选择Manual/None,则Xcode就不会自动生成代码，我们可以自己手动生成。

![6.png](http://upload-images.jianshu.io/upload_images/3873004-f173f833442ef047.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

> * 手动生成实体类代码，选中CoreDataTest.xcdatamodeld文件，然后在Mac菜单栏中选择Editor，如下图所示。一路Next就可以了。
> * 如果没有选择Manual/None，依然进行手动创建的话，则会与系统自动创建的文件发生冲突，这点需要注意。
> * 你也可以不要选择Manual/None，直接使用系统创建好的NSManagedObject，同样会有4个文件，只是在工程中是看不到的。

![手动创建NSManagedObject](http://upload-images.jianshu.io/upload_images/3873004-2b736bc1c5123364.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

>Swift中手动创建出来的是这样2个文件

![](http://upload-images.jianshu.io/upload_images/3873004-46c932fe20e13aff.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


>还要注意编程语言的选择，Swift或OC

![编程语言](http://upload-images.jianshu.io/upload_images/3873004-03e56a90691514a8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

更多内容：[https://www.jianshu.com/p/e4c106015005](https://www.jianshu.com/p/e4c106015005)