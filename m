From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v3 1/1] input/tc3589x: add tc3589x keypad support
Date: Wed, 22 Dec 2010 02:20:51 -0800
Message-ID: <20101222102050.GE22590@core.coreip.homeip.net>
References: <1292927011-6898-1-git-send-email-sundar.iyer@stericsson.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:52898 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751759Ab0LVKU7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 22 Dec 2010 05:20:59 -0500
Received: by pwj3 with SMTP id 3so274836pwj.19
        for <linux-next@vger.kernel.org>; Wed, 22 Dec 2010 02:20:59 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1292927011-6898-1-git-send-email-sundar.iyer@stericsson.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sundar Iyer <sundar.iyer@stericsson.com>
Cc: linux-next@vger.kernel.org

On Tue, Dec 21, 2010 at 03:53:31PM +0530, Sundar Iyer wrote:
> Add support for the keypad controller module found on the
> TC3589X devices. This driver default adds the support for
> TC35893 device.
> 
> Signed-off-by: Sundar Iyer <sundar.iyer@stericsson.com>
> ---
> Changes:
>  - v3: introduced keypad_stopped flag to check suspend/resume/open/close
>        operations

Acked-by: Dmitry Torokhov <dtor@mail.ru>

Thanks for making the changes.

-- 
Dmitry
