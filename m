From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tty tree with the jc_docs tree
Date: Tue, 8 Nov 2016 16:30:13 +1100
Message-ID: <20161108163013.24d165f3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@s-opensource.com>, Jiri Slaby <jslaby@suse.cz>
List-Id: linux-next.vger.kernel.org

Hi Greg,

Today's linux-next merge of the tty tree got a conflict in:

  Documentation/VGA-softcursor.txt

between commits:

  27641b953c54 ("Documentation/VGA-softcursor.txt: convert to ReST markup")
  9d85025b0418 ("docs-rst: create an user's manual book")

from the jc_docs tree and commit:

  b9c8b7fc252c ("vgacon: remove prehistoric macros")

from the tty tree.

I fixed it up (I deleted it - since 9d85025b0418 moved it - but that
means it may need fixing up in its new location to match any relevant
changes in b9c8b7fc252c) and can carry the fix as necessary. This is
now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your
tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
