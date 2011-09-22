From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: linux-next: no tree for Sept 6
Date: Wed, 21 Sep 2011 23:48:45 -0300
Message-ID: <4E7AA20D.2000605@infradead.org>
References: <20110906164049.4dd3961cb82800b8d7cc8741@canb.auug.org.au> <CACqU3MXcZ72eYNd=duPYdR_gOe-ejnHoLSMqK_ZU3y=MR2-0+A@mail.gmail.com> <CA+5PVA7CETUa0i3U20ifz5YjXAywTGD2NEQt1GcJz1OwY_DtEg@mail.gmail.com> <CACqU3MXQw4+QyBmCPcO8ZmYu0T6N+DStXBoa=JUv+ej6cWMTnw@mail.gmail.com> <CA+5PVA7Oj9BNTA93m8-rj4a7Ze_N7m3mG0-+GLG1zUSG+ekqJQ@mail.gmail.com> <CACqU3MW3w10LsZvyY4RNQ1-0TgrW39PaGeVnj78bk+p6c=1uFQ@mail.gmail.com> <4E677AF5.7050903@infradead.org> <20110911141958.8e404c8b943af1c73886cee5@canb.auug.org.au> <4E7A9544.9040006@infradead.org> <20110922122352.61843f389e78c6ffde0a703b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:35819 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751760Ab1IVCsy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 21 Sep 2011 22:48:54 -0400
In-Reply-To: <20110922122352.61843f389e78c6ffde0a703b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, linux-next@vger.kernel.org

Em 21-09-2011 23:23, Stephen Rothwell escreveu:
> Hi Mauro,
> 
> On Wed, 21 Sep 2011 22:54:12 -0300 Mauro Carvalho Chehab <mchehab@infradead.org> wrote:
>>
>> Hi Stephen,
>>
>> Please replace my media tree (v4l-dvb) by this one:
>> 	git://linuxtv.org/mchehab/media-next.git
> 
> I have switched to this from today.

Thank you!

>> I'll set soon a new tree for my edac patches as well.
> 
> OK
> 

Ok, just set a git tree for the edac drivers I'm maintaining.
It is at:
	git://git.infradead.org/users/mchehab/edac.git

It replaces both my old i7core and edac trees.

Could you please replace it for the linux-next builds?

It contains the fix for the compilation error on i386, as reported by Randy.

Thanks!
Mauro
