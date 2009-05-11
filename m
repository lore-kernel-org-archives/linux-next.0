From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: Next May 11 : BUG during scsi initialization
Date: Mon, 11 May 2009 10:25:11 -0600
Message-ID: <20090511162511.GG8112@parisc-linux.org>
References: <20090511161442.3e9d9cb9.sfr@canb.auug.org.au> <4A081002.4050802@in.ibm.com> <20090511115233.GB8112@parisc-linux.org> <4A081437.7000409@in.ibm.com> <20090511122135.GC8112@parisc-linux.org> <4A08502B.9040001@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-scsi-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A08502B.9040001@in.ibm.com>
Sender: linux-scsi-owner@vger.kernel.org
To: Sachin Sant <sachinp@in.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-scsi <linux-scsi@vger.kernel.org>, linuxppc-dev@ozlabs.org, Pekka Enberg <penberg@cs.helsinki.fi>, Nick Piggin <npiggin@suse.de>, chinang.ma@intel.com
List-Id: linux-next.vger.kernel.org

On Mon, May 11, 2009 at 09:49:55PM +0530, Sachin Sant wrote:
> Yeah so the problem seems to be with SLQB. I was able to boot Next 11 with
> SLUB on the same machine.

Is it 100% reproducable with SLQB?  Our errors were fairly hard to tickle
on demand.

-- 
Matthew Wilcox				Intel Open Source Technology Centre
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
