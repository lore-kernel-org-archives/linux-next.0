From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: [PATCH] Staging: agnx: switch config_interface to
	bss_info_changed
Date: Tue, 12 May 2009 21:37:56 +0400
Message-ID: <a4423d670905121037i3ea96b01s68367c082802684d@mail.gmail.com>
References: <1242127393-4298-1-git-send-email-a.beregalov@gmail.com>
	 <20090512164448.GJ16247@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fk-out-0910.google.com ([209.85.128.185]:19375 "EHLO
	fk-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751889AbZELRh5 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 12 May 2009 13:37:57 -0400
In-Reply-To: <20090512164448.GJ16247@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: gregkh@suse.de, johannes@sipsolutions.net, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

2009/5/12 Greg KH <greg@kroah.com>:
> On Tue, May 12, 2009 at 03:23:13PM +0400, Alexander Beregalov wrote:
>> Fix this build error:
>> drivers/staging/agnx/pci.c: In function 'agnx_config_interface':
>> drivers/staging/agnx/pci.c:315: error: dereferencing pointer to inco=
mplete type
>> ..
>> drivers/staging/agnx/pci.c:424: error: unknown field 'config_interfa=
ce' specified in initializer
>>
>> config_interface was removed in 2d0ddec5b2b
>> ("mac80211: unify config_interface and bss_info_changed")
>
> I do not see that patch in Linus's tree. =C2=A0Is it in some other tr=
ee
> (wireless?) and not yet in mainline?
Yes, it is in wireless from linux-next.
You asked to send patches based on linux-next, right?
Should I always mark patches for staging-next tree as [PATCH -next] ?
