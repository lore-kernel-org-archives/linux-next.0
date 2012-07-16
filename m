From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: Tree for July 16 (regression in timer-code)
Date: Mon, 16 Jul 2012 09:33:17 +0200
Message-ID: <CA+icZUXA9Oq8859X7KGQHT5CtueN8-=AG6sc69GgSwnMpW+k-A@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:52980 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751045Ab2GPHdV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Jul 2012 03:33:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, Jul 16, 2012 at 9:17 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Changes since 20120713:
>

Just FYI:

There is a regression in upstream's (Linus tree) timer-code which lets
machine no more come up after resume (read [1] for more details).

- Sedat -

[1] http://marc.info/?l=linux-kernel&m=134238481814544&w=2
