Received: from mx1.secunet.com (mx1.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999F8150997;
	Wed, 27 May 2026 05:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.96.220.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779858157; cv=none; b=MsQrrfNLrWF+zqMVbfckxt1KaWVCu0LnIiezIjCB1IvMK2OGGiyVAnvZHiV4YjGZ4de/d6fvzHVal6nZvL9h99rEDzeFvh92so2wIf/cbSF1D/95LDyvnCmGbJxbYs3gtjc77njGSe9tB5pA21FwZ/8av66N2urjQjakIllXZi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779858157; c=relaxed/simple;
	bh=BuNRBt2ETaOuT+3dILFP9BjUO8/6qzX/R/zpV1fDasE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T+25aYfdkvpVeNS34imgpU+zXcNTI1ONIDw/RbTOTSeREsJliNbXT/ABur/+G/D1nPWK2DmMPeczpkzvVs2xLLMmEb6Vk8ahhOx3qpQmATuDByjzJ9ih3giErS9+ujGCVz4AfFG6f32GxtjC21WlroGakiIm8JQ22gLNulZSB6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com; spf=pass smtp.mailfrom=secunet.com; dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b=FKqVuZIT; arc=none smtp.client-ip=62.96.220.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b="FKqVuZIT"
Received: from localhost (localhost [127.0.0.1])
	by mx1.secunet.com (Postfix) with ESMTP id 9998020704;
	Wed, 27 May 2026 07:02:32 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from mx1.secunet.com ([127.0.0.1])
 by localhost (mx1.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K5eJWakTSx-d; Wed, 27 May 2026 07:02:32 +0200 (CEST)
Received: from EXCH-01.secunet.de (rl1.secunet.de [10.32.0.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.secunet.com (Postfix) with ESMTPS id EF1D62050A;
	Wed, 27 May 2026 07:02:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.secunet.com EF1D62050A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1779858152;
	bh=e+ecxsf3w1wfLAwbfZfMImkE1x015altKMtmZhls9iw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:From;
	b=FKqVuZITXy/zOV7vwuXyVJPb2LDpw9F7muRGBmVU8mA2XvEQWDOV72LQeNsr2DlB3
	 CC+L1igRANb2CbeIa5PGFgDUos232UjvlKpPeLbcjkQY3b9/MWQJN+Z5ozw8svYjXv
	 R/lhRKaIB8U6xpcMwTOARGWw4/JePri2h0NUPq6oUfYS/qK6N3HU30N925VJUir6hC
	 F8kGZ26+PsULtoVhOWb4nWuFhMnNDHDlQ4eLsnI/ilT4xLXEflCdMrIp24iqPP1Jxu
	 LnyWfFNJg0VD/HXg7OIkAYUDAEUbRuJ0AfCcv6lIjU4z9u7OJ4BVPB9Q/Hj/ZxDWzp
	 hWB3fNr24rXCg==
Received: from secunet.com (10.182.7.193) by EXCH-01.secunet.de (10.32.0.171)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 27 May
 2026 07:02:31 +0200
Received: (nullmailer pid 2125855 invoked by uid 1000);
	Wed, 27 May 2026 05:02:30 -0000
Date: Wed, 27 May 2026 07:02:30 +0200
From: Steffen Klassert <steffen.klassert@secunet.com>
To: Mark Brown <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-next@vger.kernel.org>
Subject: Re: Missing signoff in the ipsec tree
Message-ID: <ahZ65tqj7eJWbiQF@secunet.com>
References: <ahWldvORuJNSMRzm@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ahWldvORuJNSMRzm@sirena.org.uk>
X-ClientProxiedBy: EXCH-02.secunet.de (10.32.0.172) To EXCH-01.secunet.de
 (10.32.0.171)

On Tue, May 26, 2026 at 02:51:50PM +0100, Mark Brown wrote:
> Commit
> 
>   2982e599fff6f ("esp: fix page frag reference leak on skb_to_sgvec failure")
> 
> is missing a Signed-off-by from its author

The commit message looks like this:

commit 2982e599fff6faa21c8df147d96fc7af6c1a2f24
Author: e521588 <alessandro.schino@sbb.ch>
Date:   Wed May 20 09:27:17 2026 +0200

    esp: fix page frag reference leak on skb_to_sgvec failure
    
    In esp_output_tail(), when esp->inplace is false, the old skb page frags
    are replaced with a new page from the xfrm page_frag cache. The source
    scatterlist (sg) is built from the old frags before the replacement, and
    esp_ssg_unref() is responsible for releasing the old page references
    after the crypto operation completes.
    
    However, if the second skb_to_sgvec() call (which builds the destination
    scatterlist from the new page) fails, the code jumps to error_free which
    only calls kfree(tmp). The old page frag references captured in the
    source scatterlist are never released:
    
      1. sg[] is built from old frags via skb_to_sgvec() (no extra get_page)
      2. nr_frags is set to 1 and frag[0] is replaced with the new page
      3. Second skb_to_sgvec() fails -> goto error_free
      4. kfree(tmp) frees the sg[] memory but old frags are not unref'd
      5. kfree_skb() only releases frag[0] (the new page), not the old ones
    
    Fix this by adding a bool parameter to esp_ssg_unref() that, when true,
    unconditionally unrefs the source scatterlist frags without checking
    req->src and req->dst, since those fields are not yet initialized by
    aead_request_set_crypt() at the point of the error. Existing callers
    pass false to preserve the original behavior.
    
    The same issue exists in both esp4 and esp6 as the code is identical.
    
    Fixes: cac2661c53f3 ("esp4: Avoid skb_cow_data whenever possible")
    Fixes: 03e2a30f6a27 ("esp6: Avoid skb_cow_data whenever possible")
    
    Signed-off-by: Alessandro Schino <7991aleschino@gmail.com>
    Signed-off-by: Steffen Klassert <steffen.klassert@secunet.com>


So 'Author:' and 'Signed-off-by:' have different mail addresses,
but the person should be the same. I did not notice that when
I applied the patch. I hope it is not a problem.
