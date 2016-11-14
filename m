From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sound tree with the jc_docs tree
Date: Mon, 14 Nov 2016 11:18:52 +1100
Message-ID: <20161114111852.5a9b3f87@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@s-opensource.com>
List-Id: linux-next.vger.kernel.org

Hi Takashi,

Today's linux-next merge of the sound tree got a conflict in:

  Documentation/sound/alsa/alsa-parameters.txt

between commit:

  8c27ceff3604 ("docs: fix locations of several documents that got moved")

from the jc_docs tree and commit:

  3a5182c04a02 ("ALSA: doc: Remove alsa-parameters.txt")

from the sound tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
