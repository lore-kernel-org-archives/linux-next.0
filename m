From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the v4l-dvb tree with the jc_docs tree
Date: Fri, 2 Dec 2016 10:31:07 +1100
Message-ID: <20161202103107.01452535@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Mauro,

Today's linux-next merge of the v4l-dvb tree got conflicts in:

  Documentation/media/uapi/v4l/dev-subdev_files/subdev-image-processing-crop.svg
  Documentation/media/uapi/v4l/dev-subdev_files/subdev-image-processing-full.svg
  Documentation/media/uapi/v4l/dev-subdev_files/subdev-image-processing-scaling-multi-source.svg

between commit:

  15a04d4e76bd ("docs-rst: auto-generate PDF image files")

from the jc_docs tree and commit:

  9e3d073009d2 ("[media] docs-rst: cleanup SVG files")

from the v4l-dvb tree.

I fixed it up (I have no idea, so I just deleted the files as the former
did.  Or were they moved?) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell
