From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Section mismatch in drivers/usb/gadget/fotg210-udc.c
Date: Wed, 19 Jun 2013 16:06:21 -0400
Message-ID: <51C20F3D.1060700@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:54743 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935092Ab3FSUFs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 19 Jun 2013 16:05:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Yuan-Hsin Chen <yhchen@faraday-tech.com>
Cc: Felipe Balbi <balbi@ti.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, linux-usb@vger.kernel.org

Hi guys,

This was seen on a linux-next (Jun18th tree) allmodconfig build:

WARNING: drivers/usb/gadget/fotg210-udc.o(.data+0x0): Section mismatch in reference from the variable fotg210_driver to the function .init.text:fotg210_udc_probe()
The variable fotg210_driver references
the function __init fotg210_udc_probe()
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

Paul.
