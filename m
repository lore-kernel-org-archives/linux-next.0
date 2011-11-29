From: Joe Perches <joe@perches.com>
Subject: git tag expiry?
Date: Tue, 29 Nov 2011 10:22:52 -0800
Message-ID: <1322590972.15134.5.camel@Joe-Laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from perches-mx.perches.com ([206.117.179.246]:56145 "EHLO
	labridge.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754966Ab1K2SWy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 29 Nov 2011 13:22:54 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next <linux-next@vger.kernel.org>

Hi Stephen.

In order to keep the next git repository size down,
are you going to continue to expire and delete older
next-<date> tags after some number of months/days/weeks?

I think it'd be sensible to keep a maximum of 2 months
of tags and once a month expire out the oldest tags
followed by a repack.
