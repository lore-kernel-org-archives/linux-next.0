From: "Arend van Spriel" <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: Regression in 9390ace brcmfmac: free net device when
 registration fails
Date: Tue, 4 Jun 2013 14:58:37 +0200
Message-ID: <51ADE47D.50700@broadcom.com>
References: <51AD1F22.2080004@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=iso-8859-1;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51AD1F22.2080004-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Hante Meuleman <meuleman-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "'linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org'" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On 06/04/2013 12:56 AM, Stephen Warren wrote:
> (John, note that this commit is part of the pull request you sent to
> Dave today)
>
> Arend,
>
> Commit 9390ace "brcmfmac: free net device when registration fails"
> causes a regression.
>
> I had the BCM4330 firmware present in my root fs, whereas my HW is a
> BCM4329. With this patch applied, I get a kernel panic on boot. With it
> reverted, I see that no issues of that nature. This is true in
> next-20130531 (and also 5/30 and 6/1 but not earlier). A bisect of
> Linus's tree followed by a merge of John's wireless pull request from
> today pointed at this same commit.

Thanks, Stephen

I will look into this.

> Related: Since the two hardware require different firmware, I wonder why
> the driver doesn't use a firmware filename that encodes the HW device ID
> instead of using the same name for all HW. This means that when I move
> my SD card between development systems, I have to copy different
> firmware over the top. That's a little painful...

I agree that for development switching cards it is kinda awkward and I 
have been fooled by it as well. We may want to change or if your itch is 
annoying enough feel free to send a patch for it ;-)

Regards,
Arend


--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
