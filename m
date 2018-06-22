From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: manual merge of the tip tree with the vfs tree
Date: Fri, 22 Jun 2018 14:06:01 +0100
Message-ID: <20180622130600.GY30522@ZenIV.linux.org.uk>
References: <e6a26908-67b2-e32e-06b5-d2e62acce305@intel.com>
 <20180622115346.1e9cc433@canb.auug.org.au>
 <29411.1529671523@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <29411.1529671523@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: David Howells <dhowells@redhat.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Jun 22, 2018 at 01:45:23PM +0100, David Howells wrote:
> Reinette Chatre <reinette.chatre@intel.com> wrote:
> 
> > Thomas and David, please let me know what I can do from my side to help
> > with this.
> 
> You could try basing on Al Viro's for-next tree which has the mount API
> changes in it.

Umm...  That would be a massive headache for everyone involved; the changes
in there have very little in common with what you are doing in rdt_mount(),
so it might make sense to start with a minimal never-rebased branch that
would
	* define rdt_pseudo_lock_init as 0
	* define rdt_pseudo_lock_release as empty
	* do the rdt_mount() part of a3dbd01e6c9d
	* have commit message along the lines of
"hooks in rdt_mount() for rdt_pseudo_lock to use

Functionally a no-op right now; the only reason for having that
as a never-rebased branch to get rdt_pseudo_lock and mount series
out of each other's hair"

Base that on -rc1, then pull it into your rdt branch and David could pull the
same into his.
