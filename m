From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH linux-next] pinctrl: fix pinconf_dbg_config_write return type
Date: Mon, 23 Sep 2013 10:45:32 +0200
Message-ID: <CACRpkdZBNjGZbbU0FznQYMc1nfqt9YWESmRSNJqJzAnyLL17Hg@mail.gmail.com>
References: <1379364632-19197-1-git-send-email-vincent.stehle@laposte.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:59243 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752635Ab3IWIpc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 23 Sep 2013 04:45:32 -0400
Received: by mail-ob0-f172.google.com with SMTP id gq1so3185950obb.17
        for <linux-next@vger.kernel.org>; Mon, 23 Sep 2013 01:45:32 -0700 (PDT)
In-Reply-To: <1379364632-19197-1-git-send-email-vincent.stehle@laposte.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?ISO-8859-1?Q?Vincent_Stehl=E9?= <vincent.stehle@laposte.net>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Mon, Sep 16, 2013 at 10:50 PM, Vincent Stehl=E9
<vincent.stehle@laposte.net> wrote:

> Have pinconf_dbg_config_write() return a ssize_t. This fixes the foll=
owing
> compilation warning:
>
>   drivers/pinctrl/pinconf.c:617:2: warning: initialization from incom=
patible pointer type [enabled by default]
>   drivers/pinctrl/pinconf.c:617:2: warning: (near initialization for =
=91pinconf_dbg_pinconfig_fops.write=92) [enabled by default]
>
> Signed-off-by: Vincent Stehl=E9 <vincent.stehle@laposte.net>
> Cc: Linus Walleij <linus.walleij@linaro.org>

Patch applied!

Yours,
Linus Walleij
