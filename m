From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the s5p tree
Date: Tue, 3 Jan 2012 17:46:39 -0800
Message-ID: <CA+55aFxgrLujQBPPTEiZk9a3GrvUpDhmR6eSd0Mg4O481MZKcg@mail.gmail.com>
References: <20120103180854.e9bff732db50c0fa9afd2967@canb.auug.org.au>
 <010601ccc9ef$7e784640$7b68d2c0$%kim@samsung.com> <CA+55aFzuEP7poPj_TiC28+T7Xn-6G1Lydt=q5FMVTj_XhOVf3w@mail.gmail.com>
 <01bb01ccca79$ae1ad770$0a508650$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ww0-f42.google.com ([74.125.82.42]:46128 "EHLO
	mail-ww0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751485Ab2ADBrB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Jan 2012 20:47:01 -0500
In-Reply-To: <01bb01ccca79$ae1ad770$0a508650$%kim@samsung.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Greg KH <greg@kroah.com>

On Tue, Jan 3, 2012 at 4:42 PM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
>>
> The driver-core tree changed usage(?) of sysdev_class and touched som=
e files
> and the changed files have been merged into one file for some reason =
without
> driver-core's changes in samsung tree. So I just wanted to avoid the
> conflicts. Linus, how should/can I do in =A0this case?

Generally, unless the conflicts are *really* bad, just ignore them,
and let me sort them out. It's nice if you mention the fact that there
will be conflicts, and some people also send me a pre-merged tree that
has the conflicts fixed up, but in general it's much better if the
different trees ignore each other - that way we don't have random
merges that mean that I cannot pull one tree without pulling another.

If the conflicts are just insanely bad, I'll ask you to resolve them
for me when I hit them, but in general that's a sign that something
nasty is going on and people are developing in the wrong trees or just
stepping on each others toes too much.

                   Linus
