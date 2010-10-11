From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for October 8 (staging/brcm80211)
Date: Sun, 10 Oct 2010 21:08:54 -0700
Message-ID: <4CB28DD6.8000505@oracle.com>
References: <20101008161552.07c9f137.sfr@canb.auug.org.au> <20101010115832.0bf5dff8.randy.dunlap@oracle.com> <20101010202906.GA4900@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20101010202906.GA4900@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, driverdevel <devel@driverdev.osuosl.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Brett Rudley <brudley@broadcom.com>, Henry Ptasinski <henryp@broadcom.com>, Nohee Ko <noheek@broadcom.com>
List-Id: linux-next.vger.kernel.org

On 10/10/10 13:29, Greg KH wrote:
> On Sun, Oct 10, 2010 at 11:58:32AM -0700, Randy Dunlap wrote:
>> On Fri, 8 Oct 2010 16:15:52 +1100 Stephen Rothwell wrote:
>>
>>> Hi all,
>>>
>>> Changes since 20101007:
>>
>>
>>
>> drivers/staging/brcm80211/brcmfmac/dhd_linux.c:432: note: expected 'void *' but argument is of type 'sk_buff_data_t'
>> drivers/staging/brcm80211/brcmfmac/wl_cfg80211.c:1337: warning: format '%d' expects type 'int', but argument 3 has type 'size_t'
> 
> This is x86-64, right?

Yes.

>> drivers/staging/brcm80211/brcmfmac/wl_cfg80211.c:2120: warning: initialization from incompatible pointer type
>> drivers/staging/brcm80211/brcmfmac/wl_cfg80211.c:2121: warning: initialization from incompatible pointer type
>> drivers/staging/brcm80211/brcmfmac/wl_cfg80211.c:2122: warning: initialization from incompatible pointer type
>> drivers/staging/brcm80211/brcmfmac/wl_cfg80211.c:4035: warning: format '%d' expects type 'int', but argument 2 has type 'size_t'
>> drivers/staging/brcm80211/brcmfmac/wl_cfg80211.c:4048: warning: format '%d' expects type 'int', but argument 2 has type 'size_t'
> 
> I'll work on these.
> 
> thanks,
> 
> greg k-h


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
