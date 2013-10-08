From: Thierry Reding <thierry.reding@gmail.com>
Subject: linux-next: manual merge of the tty-next tree
Date: Tue,  8 Oct 2013 15:44:15 +0200
Message-ID: <1381239855-16314-5-git-send-email-treding@nvidia.com>
References: <1381239855-16314-1-git-send-email-treding@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1381239855-16314-1-git-send-email-treding@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Fabio Estevam <fabio.estevam@freescale.com>, Sascha Hauer <s.hauer@pengutronix.de>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Today's linux-next merge of the tty-next tree got a conflict in

	drivers/tty/serial/imx.c

caused by commits e2c2725 (serial: imx: Use NULL as the last argument of
add_preferred_console()) and b4e788d (Revert "serial: i.MX: evaluate
linux,stdout-path property").

The former commit only changes a parameter from 0 to NULL I assume it
doesn't solve the build breakage mentioned as reason for the revert, so
I kept the reversion.

Thierry
