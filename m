From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: linux-next: build failure after merge of the s5p tree
Date: Wed, 04 Jan 2012 09:42:04 +0900
Message-ID: <01bb01ccca79$ae1ad770$0a508650$%kim@samsung.com>
References: <20120103180854.e9bff732db50c0fa9afd2967@canb.auug.org.au>
 <010601ccc9ef$7e784640$7b68d2c0$%kim@samsung.com>
 <CA+55aFzuEP7poPj_TiC28+T7Xn-6G1Lydt=q5FMVTj_XhOVf3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:37988 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754643Ab2ADAmJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Jan 2012 19:42:09 -0500
In-reply-to: <CA+55aFzuEP7poPj_TiC28+T7Xn-6G1Lydt=q5FMVTj_XhOVf3w@mail.gmail.com>
Content-language: ko
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: 'Linus Torvalds' <torvalds@linux-foundation.org>
Cc: 'Stephen Rothwell' <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 'Greg KH' <greg@kroah.com>

Linus Torvalds wrote:
> 
> On Tue, Jan 3, 2012 at 12:12 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> >
> > OK, I see. Firstly, I will rebase my for-next as per your suggestion. As
> you
> > know, I just wanted to avoid known conflicts with driver-core tree.
> 
> Please, in general you should *not* rebase on top of other peoples

OK, I will remember. And as a note, I didn't 'rebase' on top of other tree
just 'merge' in the case of having dependency with others and of course if
that is _really_ required. But we know, if the merged tree is rebased,
something wrong will happen :(

> trees either. What's the conflict and why do you need that other tree
> in the first place?
> 
The driver-core tree changed usage(?) of sysdev_class and touched some files
and the changed files have been merged into one file for some reason without
driver-core's changes in samsung tree. So I just wanted to avoid the
conflicts. Linus, how should/can I do in  this case?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
