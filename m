From: Mauro Carvalho Chehab <mchehab@redhat.com>
Subject: Re: [PATCH -next] staging: altera-jtag needs delay.h
Date: Tue, 29 Mar 2011 22:56:50 -0300
Message-ID: <4D928DE2.8070804@redhat.com>
References: <20110304180027.20deb6c4.sfr@canb.auug.org.au>	<20110304173528.60c04f76.randy.dunlap@oracle.com> <AANLkTinhKKtPS7-tFcoU8JE=zsgikEn979DemyXX8q_z@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:14350 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755334Ab1C3B5H (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 29 Mar 2011 21:57:07 -0400
In-Reply-To: <AANLkTinhKKtPS7-tFcoU8JE=zsgikEn979DemyXX8q_z@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "Igor M. Liplianin" <liplianin@netup.ru>

Em 29-03-2011 18:27, Alexander Beregalov escreveu:
> On 5 March 2011 04:35, Randy Dunlap <randy.dunlap@oracle.com> wrote:
>> From: Randy Dunlap <randy.dunlap@oracle.com>
>>
>> altera-jtag.c needs to include <linux/delay.h> to fix a build error:
>>
>> drivers/staging/altera-stapl/altera-jtag.c:398: error: implicit declaration of function 'udelay'
>>
>> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
>> Cc: Igor M. Liplianin <liplianin@netup.ru>
> 
> Mauro, Greg. 2.6.39 still needs this fix.

I'm updating the fix right now to -next. I'll be sending it upstream after having it
merged there.

Thanks,
Mauro.
