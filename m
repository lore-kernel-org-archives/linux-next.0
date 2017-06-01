From: Bart Van Assche <bart.vanassche@sandisk.com>
Subject: Re: linux-next: manual merge of the target-bva tree with the
 target-updates tree
Date: Thu, 1 Jun 2017 14:14:06 -0700
Message-ID: <aff8f6fa-89b4-3dee-2c3f-68eae613fbba@sandisk.com>
References: <20170601141055.3b64fefc@canb.auug.org.au>
 <1496293179.16453.1.camel@sandisk.com>
 <1496293444.27407.184.camel@haakon3.risingtidesystems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:39375 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751128AbdFAVOQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Jun 2017 17:14:16 -0400
In-Reply-To: <1496293444.27407.184.camel@haakon3.risingtidesystems.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On 05/31/17 22:04, Nicholas A. Bellinger wrote:
> Go ahead and get list review on drivers/target/ changes before pushing
> them into linux-next, please.
> 
> Btw, I don't care if you queue up one's that do have at least two
> Reviewed-bys into your tree, but everything that doesn't have
> Reviewed-bys or Acked-by should not be going into linux-next.

It is not your job to rewrite the rules for linux-next. I'm following
the guidelines I received from Stephen in December 2016. You were copied
on the e-mail with guidelines Stephen sent to me. See also
https://www.spinics.net/lists/linux-next/msg38488.html.

Stephen, if anything would have changed in the meantime that I'm not
aware of please let me know.

Bart.
