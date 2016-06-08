From: "Valo, Kalle" <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Subject: Re: [PATCH] Add .set_antenna callback in ath6kl driver to remove
 wireless core warns
Date: Wed, 8 Jun 2016 14:23:47 +0000
Message-ID: <87wplzkbd9.fsf@kamboji.qca.qualcomm.com>
References: <1465388474-20503-1-git-send-email-prasunmaiti87@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465388474-20503-1-git-send-email-prasunmaiti87-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
	(Prasun Maiti's message of "Wed, 8 Jun 2016 17:51:14 +0530")
Content-Language: en-US
Content-ID: <0862663725086E4082EBF9CF2191927D-zC7DfRvBq/JWk0Htik3J/w@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Prasun Maiti <prasunmaiti87-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ath6kl-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <ath6kl-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Next <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel <prasunmaii87-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-next.vger.kernel.org

Prasun Maiti <prasunmaiti87-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> Since add more warnings for inconsistent ops in cfg80211, the wireless
> core warns if a driver implements a cfg80211 callback but doesn't
> implements the inverse operation. The ath6kl driver implements a cfg80211
> .get_antenna operation handler but doesn't have the inverse .set_antenna
> callback. So, it makes warning.
>
> To remove this warning, add .set_antenna callback in ath6kl driver and
> also send a cmd to firmware with it's values.
>
> Signed-off-by: Prasun Maiti <prasunmaiti87-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Did you test this? What hardware and firmware version?

-- 
Kalle Valo--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
