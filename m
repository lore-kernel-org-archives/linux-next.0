From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: linux-next: manual merge of the xen tree with the
	tip tree
Date: Fri, 22 Oct 2010 12:10:06 -0700
Message-ID: <4CC1E18E.9040502@goop.org>
References: <20101022140335.c4a3a48f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <xen-devel-bounces@lists.xensource.com>
In-Reply-To: <20101022140335.c4a3a48f.sfr@canb.auug.org.au>
List-Unsubscribe: <http://lists.xensource.com/mailman/listinfo/xen-devel>,
	<mailto:xen-devel-request@lists.xensource.com?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xensource.com>
List-Help: <mailto:xen-devel-request@lists.xensource.com?subject=help>
List-Subscribe: <http://lists.xensource.com/mailman/listinfo/xen-devel>,
	<mailto:xen-devel-request@lists.xensource.com?subject=subscribe>
Sender: xen-devel-bounces@lists.xensource.com
Errors-To: xen-devel-bounces@lists.xensource.com
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Xen Devel <Xen-devel@lists.xensource.com>, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Yinghai Lu <yinghai@kernel.org>, Ingo Molnar <mingo@elte.hu>, Gianluca Guida <gianluca.guida@citrix.com>
List-Id: linux-next.vger.kernel.org

 On 10/21/2010 08:03 PM, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the xen tree got a conflict in
> arch/x86/mm/init_32.c between commit
> 1d931264af0f10649b35afa8fbd2e169da51ac08 ("x86-32, memblock: Make
> add_highpages honor early reserved ranges") from the tip tree and commit
> 07147a06ac3b1b028124ea00ba44e69eb8ea7685 ("x86/32: honor reservations of
> high memory") from the xen tree.

Hm, that change has been completely obsoleted by the memblock stuff from
tip.  Oh, I see.  Another change which ended up reverting that patch via
a merge got dropped, so it got left lying around.  I'll pull it out.

(Not sure why it merges cleanly for me however; I guess because you've
already got the older xen branch in there which contains the merge.)

Anyway, update pushed.

    J
