From: Andy Whitcroft <apw@shadowen.org>
Subject: Re: linux-next: Tree for August 28
Date: Fri, 29 Aug 2008 09:12:08 +0100
Message-ID: <20080829081154.GB3387@brain>
References: <20080828183307.23c6be82.sfr@canb.auug.org.au> <20080828143934.a5034a01.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755262AbYH2IMt@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080828143934.a5034a01.akpm@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.de>
List-Id: linux-next.vger.kernel.org

On Thu, Aug 28, 2008 at 02:39:34PM -0700, Andrew Morton wrote:
> On Thu, 28 Aug 2008 18:33:07 +1000
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > I have created today's linux-next tree at
> > git://git.kernel.org/pub/scm/linux/kernel/git/sfr/linux-next.git
> 
> firmware/yamaha/yss225_registers.bin.ihex uses \r\n line termination.
> Is that actually required, or can we use plain old \n?
> 
> Andy, a checkpatch rule for this would be nice.

Ahhh, well we do have a check for DOS line endings, but it only applies
to 'source' files.  I guess what we should do is bring ihex in as a
'text' file format and apply limited checks to that.

-apw
