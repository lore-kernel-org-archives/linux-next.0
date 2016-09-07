From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [next] make htmldocs fails with "too many values to unpack"
Date: Wed, 7 Sep 2016 15:06:23 +0200
Message-ID: <CAMuHMdVP6ANoWcmQC8NcSGirTujBASyO84UcNxpq0jbcW0Up4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:37054 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757224AbcIGNGY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Sep 2016 09:06:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Linux-Next <linux-next@vger.kernel.org>

On next-20160907, "make htmldocs" fails:

Exception occurred:
  File "/usr/lib/python2.7/dist-packages/sphinx/environment.py", line
1530, in create_index
    for type, value, tid, main in entries:
ValueError: too many values to unpack
The full traceback has been saved in /tmp/sphinx-err-GYk3bJ.log, if
you want to report the issue to the developers.
Please also report this if it was a user error, so that a better error
message can be provided next time.
A bug report can be filed in the tracker at
<https://bitbucket.org/birkenfeld/sphinx/issues/>. Thanks!

It works fine on v4.8-rc5.

Full traceback:

# Sphinx version: 1.2.2
# Python version: 2.7.6
# Docutils version: 0.11 release
# Jinja2 version: 2.7.2
# Loaded extensions:
#   kernel_include from
<prefix>/linux-next/Documentation/sphinx/kernel_include.pyc
#   kernel-doc from <prefix>/linux-next/Documentation/sphinx/kernel-doc.pyc
#   rstFlatTable from <prefix>/linux-next/Documentation/sphinx/rstFlatTable.pyc
#   cdomain from <prefix>/linux-next/Documentation/sphinx/cdomain.pyc
#   sphinx.ext.pngmath from
/usr/lib/python2.7/dist-packages/sphinx/ext/pngmath.pyc
#   sphinx.ext.oldcmarkup from
/usr/lib/python2.7/dist-packages/sphinx/ext/oldcmarkup.pyc
Traceback (most recent call last):
  File "/usr/lib/python2.7/dist-packages/sphinx/cmdline.py", line 254, in main
    app.build(force_all, filenames)
  File "/usr/lib/python2.7/dist-packages/sphinx/application.py", line
212, in build
    self.builder.build_update()
  File "/usr/lib/python2.7/dist-packages/sphinx/builders/__init__.py",
line 214, in build_update
    'out of date' % len(to_build))
  File "/usr/lib/python2.7/dist-packages/sphinx/builders/__init__.py",
line 279, in build
    self.finish()
  File "/usr/lib/python2.7/dist-packages/sphinx/builders/html.py",
line 458, in finish
    self.write_genindex()
  File "/usr/lib/python2.7/dist-packages/sphinx/builders/html.py",
line 492, in write_genindex
    genindex = self.env.create_index(self)
  File "/usr/lib/python2.7/dist-packages/sphinx/environment.py", line
1530, in create_index
    for type, value, tid, main in entries:
ValueError: too many values to unpack

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
