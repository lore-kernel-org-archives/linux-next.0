From: Frank Seidel <fseidel@suse.de>
Subject: Re: [PATCH next 2/2] pohmelfs: fix printk format warnings
Date: Fri, 13 Feb 2009 14:29:54 +0100
Message-ID: <499575D2.3000708@suse.de>
References: <20090213125944.GB7003@orion> <20090213131400.GF23879@ioremap.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ns.suse.de ([195.135.220.2]:37573 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751616AbZBMNfP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 13 Feb 2009 08:35:15 -0500
In-Reply-To: <20090213131400.GF23879@ioremap.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Evgeniy Polyakov <zbr@ioremap.net>
Cc: Alexander Beregalov <a.beregalov@gmail.com>, gregkh@suse.de, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Evgeniy Polyakov wrote:
> Doesn't size_t have %zu format?

That's right. So that would be even more accurate.

Thanks,
Frank
