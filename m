From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sound tree with the jc_docs tree
Date: Mon, 14 Nov 2016 11:15:53 +1100
Message-ID: <20161114111553.533d5615@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, SeongJae Park <sj38.park@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi Takashi,

Today's linux-next merge of the sound tree got a conflict in:

  Documentation/index.rst

between commits:

  799a545bb938 ("tpm: move documentation under Documentation/security")
  ba42c574fc8b ("Documentation: Add HOWTO Korean translation into rst based build system")

from the jc_docs tree and commit:

  8551914a5e19 ("ALSA: doc: ReSTize alsa-driver-api document")

from the sound tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc Documentation/index.rst
index 733bd9013541,115c551da5f5..000000000000
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@@ -57,16 -18,8 +57,17 @@@ needed)
     media/index
     gpu/index
     80211/index
 +   security/index
+    sound/index
  
 +Korean translations
 +-------------------
 +
 +.. toctree::
 +   :maxdepth: 1
 +
 +   translations/ko_KR/index
 +
  Indices and tables
  ==================
  
