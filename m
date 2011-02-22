From: Mattia Dongili <malattia@linux.it>
Subject: Re: linux-next: build failure after merge of the drivers-x86 tree
Date: Tue, 22 Feb 2011 15:26:53 +0900
Message-ID: <a8c6f32c-ccb5-4f65-b537-8bd1c11f7336@email.android.com>
References: <20110222162206.c3fb0636.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from static-220-247-10-204.b-man.svips.gol.ne.jp ([220.247.10.204]:49996
	"EHLO smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750790Ab1BVGfP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 Feb 2011 01:35:15 -0500
In-Reply-To: <20110222162206.c3fb0636.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Matthew Garrett <mjg59@srcf.ucam.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org



Stephen Rothwell <sfr@canb.auug.org.au> wrote:

>Hi Matthew,
>
>After merging the drivers-x86 tree, today's linux-next build (x86_64
>allmodconfig) failed like this:

Apologies, I didn't test my code with
DEBUG_LOCK_ALLOC=y.
I'll send a fix in as soon as I get around a usable network
connection.

-- 
mattia
:wq
