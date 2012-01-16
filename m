From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Please include modem_shm in linux-next
Date: Mon, 16 Jan 2012 16:46:16 +0100
Message-ID: <CACRpkdYjvu2Tq7b6wGn9CnMtDjb7zcenbcUM7Br2gEVq7Xpq4Q@mail.gmail.com>
References: <CACRpkdYDR4S_P-CUiJoB1bBpESGs9nG+5=Mr5M-5cGF5UkOvJw@mail.gmail.com>
	<81C3A93C17462B4BBD7E272753C105791FB10F9CC9@EXDCVYMBSTM005.EQ1STM.local>
	<20120113111055.83755960f93161d3542e4763@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:60503 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754888Ab2APPqQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Jan 2012 10:46:16 -0500
Received: by iagf6 with SMTP id f6so2726458iag.19
        for <linux-next@vger.kernel.org>; Mon, 16 Jan 2012 07:46:16 -0800 (PST)
In-Reply-To: <20120113111055.83755960f93161d3542e4763@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Sjur BRENDELAND <sjur.brandeland@stericsson.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Fri, Jan 13, 2012 at 1:10 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> I would also like to hear from Linus Walleij ...

Please replace my repo with Sjurs (whenever it merges fine).

Sjur, I guess an option would be if you rebase your for-next
onto 3.3-rc1 as soon as it appears? I usually do that as a
starter, then rebase to later -rc:s only if necessary (e.g. due to
massive fixes going in in the early -rc:s)

For example for the last merge window my pull request was
based on the 3.2-rc3 tag.

Linus Walleij
