From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: linux-next: manual merge of the jc_docs tree with the drm-misc
 tree
Date: Fri, 19 Aug 2016 11:50:09 -0600
Message-ID: <20160819115009.354453a6@lwn.net>
References: <20160819115215.6585dc3a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160819115215.6585dc3a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Markus Heiser <markus.heiser@darmarIT.de>
List-Id: linux-next.vger.kernel.org

On Fri, 19 Aug 2016 11:52:15 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the jc_docs tree got a conflict in:
> 
>   Documentation/gpu/index.rst
> 
> between commit:
> 
>   b754b35b089d ("vgaarbiter: rst-ifiy and polish kerneldoc")
> 
> from the drm-misc tree and commit:
> 
>   505f711174b0 ("doc-rst: add index to sub-folders")
> 
> from the jc_docs tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Thanks, the fix is good.

Daniel: my apologies, I should have asked for that patch to be split up
and the relevant pieces sent through the gpu and media trees.

jon
