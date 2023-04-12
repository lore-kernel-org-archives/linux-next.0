Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A06EFC7619A
	for <linux-next@archiver.kernel.org>; Wed, 12 Apr 2023 17:16:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231233AbjDLRQK (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 12 Apr 2023 13:16:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230224AbjDLRQF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 Apr 2023 13:16:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A67C15B8E;
        Wed, 12 Apr 2023 10:15:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B68A462F86;
        Wed, 12 Apr 2023 17:15:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2207C433EF;
        Wed, 12 Apr 2023 17:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1681319746;
        bh=oKOri/ehZiXX08bBjOLOZYRdoc7KFhaFvEnpEKAJHus=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k/0dHUSKvnOPjKvKuBH6Rc2HvoQLTlAOsGi4qVfXRFJn7OOxVUSilzlMmawk5deoQ
         GrNECiSzpuIKtbclFrAJtjO6A2hiE4NKpkQcR1dmAYNnrSLpgynH6FhlcktqZp3Hbn
         RD+1nSbNPtxy6/ZCy+Ayy94es/wsVYZc3QkpvXUE=
Date:   Wed, 12 Apr 2023 19:15:43 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     daniel@ffwll.ch, sfr@canb.auug.org.au, ogabbay@kernel.org,
        jacek.lawrynowicz@linux.intel.com, quic_pkanojiy@quicinc.com,
        mani@kernel.org, airlied@redhat.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org
Subject: Re: [PATCH] Revert "accel/qaic: Add mhi_qaic_cntl"
Message-ID: <2023041201-underwear-consumer-1eb8@gregkh>
References: <1681307864-3782-1-git-send-email-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1681307864-3782-1-git-send-email-quic_jhugo@quicinc.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Apr 12, 2023 at 07:57:44AM -0600, Jeffrey Hugo wrote:
> This reverts commit 566fc96198b4bb07ca6806386956669881225271.
> 
> This exposes a userspace API that is still under debate.  Revert the
> change before the uAPI gets exposed to avoid making a mistake.  QAIC is
> otherwise still functional.
> 
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

And can you cc: me when you resubmit this?  It's not really correct in a
number of places and can be made simpler if you really want to have your
own class and device major.

thanks,

greg k-h
