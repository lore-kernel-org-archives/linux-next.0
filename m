From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: next-20091029: fs/aio.c build failure
Date: Thu, 29 Oct 2009 15:40:03 +0300
Message-ID: <a4423d670910290540x21ab0692p90ebd04b5c3d62e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f228.google.com ([209.85.219.228]:65212 "EHLO
	mail-ew0-f228.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752488AbZJ2MpB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 Oct 2009 08:45:01 -0400
Received: by ewy28 with SMTP id 28so1872322ewy.18
        for <linux-next@vger.kernel.org>; Thu, 29 Oct 2009 05:45:05 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next <linux-next@vger.kernel.org>, jmoyer@redhat.com, jens.axboe@oracle.com

Hi

fs/aio.c:1575: error: implicit declaration of function 'blk_run_address_space'

CONFIG_BLOCK is not set.
