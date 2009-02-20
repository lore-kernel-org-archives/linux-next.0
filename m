From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH -next] eeepc: needs to depend on INPUT
Date: Fri, 20 Feb 2009 22:35:40 +0100
Message-ID: <71cd59b00902201335y3cc0acacod7257548a76ed6b9@mail.gmail.com>
References: <20090220002832.cad00fcd.sfr@canb.auug.org.au>
	 <499D93F0.2090803@oracle.com>
	 <71cd59b00902191012k764bab32n85f54fc049e35035@mail.gmail.com>
	 <499DA235.6090700@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wa-out-1112.google.com ([209.85.146.177]:59959 "EHLO
	wa-out-1112.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752862AbZBTVfl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 20 Feb 2009 16:35:41 -0500
In-Reply-To: <499DA235.6090700@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <randy.dunlap@oracle.com>

On Thu, Feb 19, 2009 at 7:17 PM, Randy Dunlap <randy.dunlap@oracle.com> wrote:
> Corentin Chary wrote:
>> On Thu, Feb 19, 2009 at 6:16 PM, Randy Dunlap <randy.dunlap@oracle.com> wrote:
>>> From: Randy Dunlap <randy.dunlap@oracle.com>
>>>
>>> EEEPC_LAPTOP needs to depend on INPUT to fix build errors that
>>> can happen when EEEPC_LAPTOP=y and INPUT=m:
>>
>> There is already a patch sent to linux-acpi and Len Brown.
>>
>> http://patchwork.kernel.org/patch/7354/
>
> Today's linux-next doesn't build (doesn't have that patch).  :(
>

Hi Len,
Just a reminder for the patchs I send some days ago to fix this build
error, and two regressions. In case you miss them.

http://patchwork.kernel.org/patch/7354/
http://patchwork.kernel.org/patch/7357/
http://patchwork.kernel.org/patch/7356/

Thanks

-- 
Corentin Chary
http://xf.iksaif.net
