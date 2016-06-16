From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jun 16 (linux/firmware.h)
Date: Thu, 16 Jun 2016 08:02:05 -0700
Message-ID: <5762BF6D.2070604@infradead.org>
References: <20160616154924.1c391bfb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:51212 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754572AbcFPPCH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 16 Jun 2016 11:02:07 -0400
In-Reply-To: <20160616154924.1c391bfb@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On 06/15/16 22:49, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20160615:
> 

on i386 and/or x86_64:

In file included from ../drivers/fpga/fpga-mgr.c:21:0:
../include/linux/firmware.h:82:1: error: expected identifier or ( before { token
 {
 ^


-- 
~Randy
