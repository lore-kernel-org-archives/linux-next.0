From: Tony Luck <tony.luck@gmail.com>
Subject: Re: linux-next: build failure after merge of the ia64 tree
Date: Fri, 11 Jan 2013 10:44:51 -0800
Message-ID: <CA+8MBbKZ7tiiTTM6Dwqaqg3MK6mSMAiYOmLUJhGc8m1F5vrfiw@mail.gmail.com>
References: <20130111105440.3497d6f8c79189ff6a1bd236@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vc0-f179.google.com ([209.85.220.179]:56239 "EHLO
	mail-vc0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754776Ab3AKSow (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 11 Jan 2013 13:44:52 -0500
In-Reply-To: <20130111105440.3497d6f8c79189ff6a1bd236@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Seiji Aguchi <seiji.aguchi@hds.com>

On Thu, Jan 10, 2013 at 3:54 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> ERROR: "pstore_cannot_block_path" [drivers/firmware/efivars.ko] undefined!

Should be fixed today (allmodconfig builds for me).  I applied Seiji's
new version
of the patchset that included the missing EXPORT_SYMBOL_GPL.

-Tony
