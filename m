From: "Valo, Kalle" <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Subject: Re: [PATCH] Add .set_antenna callback in ath6kl driver to remove
 wireless core warns
Date: Wed, 8 Jun 2016 14:46:47 +0000
Message-ID: <87porrkaax.fsf@kamboji.qca.qualcomm.com>
References: <1465388474-20503-1-git-send-email-prasunmaiti87@gmail.com>
	<87wplzkbd9.fsf@kamboji.qca.qualcomm.com>
	<CAEO8o4=DnEfXQAnAOxugC9TngbhvgV9DXz0HOVHNLk0B2fAXQA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAEO8o4=DnEfXQAnAOxugC9TngbhvgV9DXz0HOVHNLk0B2fAXQA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>	(Prasun
 Maiti's message of "Wed, 8 Jun 2016 20:05:15 +0530")
Content-Language: en-US
Content-ID: <89CFE10F2E35A04BBE123A2233089962-zC7DfRvBq/JWk0Htik3J/w@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Prasun Maiti <prasunmaiti87-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ath6kl-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <ath6kl-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Next <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

Prasun Maiti <prasunmaiti87-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> No. I did not any test for that case.
> This driver create a new wiphy for use with cfg80211 through
> "wiphy_new_nm" api, but in this api, I found that more warnings for
> inconsistent ops are added there. e.g; "WARN_ON(ops->set_antenna &&
> !ops->get_antenna);"
> So, warning comes during creation of a new wiphy. That's why It is needed.

I'm confused. Are you really saying that you added a new firmware
command (WMI_SET_ANTENNA_CMDID) to ath6kl but you didn't test it in any
way? How do you know that it works then?

-- 
Kalle Valo--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
