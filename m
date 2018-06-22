From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: manual merge of the tip tree with the vfs tree
Date: Fri, 22 Jun 2018 13:45:23 +0100
Message-ID: <29411.1529671523@warthog.procyon.org.uk>
References: <e6a26908-67b2-e32e-06b5-d2e62acce305@intel.com> <20180622115346.1e9cc433@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e6a26908-67b2-e32e-06b5-d2e62acce305@intel.com>
Content-ID: <29410.1529671523.1@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: dhowells@redhat.com, Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Al Viro <viro@ZenIV.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Reinette Chatre <reinette.chatre@intel.com> wrote:

> Thomas and David, please let me know what I can do from my side to help
> with this.

You could try basing on Al Viro's for-next tree which has the mount API
changes in it.  Sorry, I was hoping that this would go in the last merge
window, but I don't think Al has sufficient bandwidth available.

Note that it's likely to get rebased shortly as I have some patches to apply,
which given we're not at -rc2 yet, I'd like to roll into the original patches
to for bisectability reasons.

Also, Eric has some user_ns fixes that conflict with my procfs changes that he
wants to get upstream, though Linus said no - so I'm not sure what's going to
happen there.

David
