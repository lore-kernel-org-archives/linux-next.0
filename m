From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: [BUILD-FAILURE] linux-next: Tree for June 30
Date: Tue, 01 Jul 2008 01:15:15 -0700
Message-ID: <m17ic6qauk.fsf@frodo.ebiederm.org>
References: <20080701001656.e156585c.sfr@canb.auug.org.au>
	<48690385.7030500@linux.vnet.ibm.com>
	<48690D3C.1060803@linux.vnet.ibm.com>
	<20080630185943.GA24692@uranus.ravnborg.org>
	<20080630192610.GA6584@elte.hu>
	<20080630194727.GA26682@uranus.ravnborg.org>
	<20080630200623.GE6584@elte.hu>
	<20080630202506.GA28050@uranus.ravnborg.org>
	<486943F1.80606@zytor.com> <48695449.5010602@zytor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757192AbYGAIWU@vger.kernel.org>
In-Reply-To: <48695449.5010602@zytor.com> (H. Peter Anvin's message of "Mon,
	30 Jun 2008 14:46:49 -0700")
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Ingo Molnar <mingo@elte.hu>, Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jens Axboe <jens.axboe@oracle.com>, Andy Whitcroft <apw@shadowen.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Vivek Goyal <vgoyal@in.ibm.com>
List-Id: linux-next.vger.kernel.org

"H. Peter Anvin" <hpa@zytor.com> writes:

> Here is a patch to replace the hard-coded limit with dynamic allocation. I have
> only build-tested it, but it seems to work.
>
> Please try it out; barring any screams to the contrary I'll add it to -tip.

Looks reasonable to me.  When generalizing from a test program to something
that can be used every day I think I just overlooked the fact that I had not
dynamically allocated the section count.

Eric
