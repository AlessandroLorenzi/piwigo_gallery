Piwigo Gallery
==============

Jekyll plugin to generate thumbnails from a directory of images and display them with a Liquid tag from Piwigo site

Installation
--------------
0. Drop `piwigo_gallery.rb` into your Jekyll site's `_plugins` folder.
1. Add the following to your `_config.yml` and customize to taste.

``` yaml
piwigo_gallery:
    baseurl: http://photos.gallery.com/piwigo/
```

* `baseurl` — The URL to your piwigo site.


Usage
-------

Jekyll will automatically generate (during builds) thumbnails for any images in the folder specified in `_config.yml`. To display them in a post, you would use a Liquid tag set up like this:

```
{% piwigo_gallery galleryid %}
```


Note
----
Jekyll will output some HTML that is (intentionally) similar to what WordPress does for galleries in posts, making it relatively simple to tweak your CSS. It will also add `rel` attributes to the links, which contain the "galleryname" text as shown in the above example. This makes is easy to integrate a lightbox script like [FancyBox.](http://fancyapps.com/fancybox/)
