From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: linux-next: manual merge of the battery tree with the hid tree
Date: Fri, 20 Mar 2015 08:58:38 +0100
Message-ID: <CAJKOXPer=oM98UwobA9SmiE9cjk3BUqkJVzcHQLVTBdVzwYd7w@mail.gmail.com>
References: <20150320151110.02e10b33@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yk0-f174.google.com ([209.85.160.174]:36597 "EHLO
	mail-yk0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750969AbbCTH6j (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 20 Mar 2015 03:58:39 -0400
In-Reply-To: <20150320151110.02e10b33@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Sebastian Reichel <sre@kernel.org>, Jiri Kosina <jikos@jikos.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Jason Gerecke <killertofu@gmail.com>

2015-03-20 5:11 GMT+01:00 Stephen Rothwell <sfr@canb.auug.org.au>:
> Hi Sebastian,
>
> Today's linux-next merge of the battery tree got conflicts in
> drivers/hid/wacom.h and drivers/hid/wacom_sys.c between commit
> 953f2c5f7163 ("HID: wacom: Centralize updating of wacom_wac battery
> status") and fce9957d8f61 ("HID: wacom: Allow dynamic battery
> creation/destruction") from the hid tree and commit 297d716f6260
> ("power_supply: Change ownership from driver to core") from the battery
> tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).  I also applied the following merge fixup patch.
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 20 Mar 2015 14:59:36 +1100
> Subject: [PATCH] HID: wacom: merge fix for "Change ownership from driver to core"
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/hid/wacom_wac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> index 5588ba80ede9..57ee0d807af1 100644
> --- a/drivers/hid/wacom_wac.c
> +++ b/drivers/hid/wacom_wac.c
> @@ -62,7 +62,7 @@ static void wacom_notify_battery(struct wacom_wac *wacom_wac,
>                 wacom_wac->ps_connected = ps_connected;
>
>                 if (wacom->battery.dev)

Should be:
if (wacom->battery)

Rest of patch looks fine but indeed some more changes are required.

How about preparing an immutable branch from HID or battery tree so we
could resolve these conflicts easily?

Best regards,
Krzysztof
