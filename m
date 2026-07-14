Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33AE44CAE0;
	Tue, 14 Jul 2026 12:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784033724; cv=none; b=VLN7M9wz2vox9xOtQFZVu+M2Dghkk6ohTQMPFbJY1oMV3+Is/VxUWMa0zhP98WcMlsEuRWANqAdOqkFdCRhP5gAiZq4iVAa36Uh68+muz/xq26xel1yn/5MXMpMUsOk+1IVpwT+0CVCAng5F0/uqyKJVpQ/uWGvfIrbdGuf/xvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784033724; c=relaxed/simple;
	bh=3sJwIMEsunCQ4tyauiPw8+KPoJ3Hn3ozjP9toT01A7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tlhp0sX9S2DO9mS8ihTW9iwAV/usfYh9UR8O8DiG0OY6hAcDOJkzZItF5pcEu35iYHjaiKDkqUYo3Ap4LwWyTvMESksHnAspFMAfL+QnytRpcYu0TcU6WVbRm4ctHBnVTi/YofHaJKQBgTmf+DzHN4TqncrkRM9IuNdLwWaluYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=jkt1CPJX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=db6JE6j9; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="jkt1CPJX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="db6JE6j9"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1A5617A00B3;
	Tue, 14 Jul 2026 08:55:20 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 14 Jul 2026 08:55:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1784033719; x=1784120119; bh=Cnw8sbx597
	bdXAnRBLys9D1D7esLSj3ODge5snKZ+4k=; b=jkt1CPJX0YMIaVbehC4SYk8J9N
	ZVabrgvZH/KaxYN5vLcnYiHfGzoYDUicNcGYc4SK/ABSoko/nv9ZhtLNz1mYRnbe
	Nb9vIR+Xx+kd0bXuY9y3AQUXhv2BHf3vvN/Zhv7HmOyOK7kumxVpuTZO6GjMczS4
	EVEDBWz3vmZ+mIThBcONsypLZ5NW9OpTwHe4HejVeYDULmcjc/EZYVEaq3Uv03zS
	i1+XbyArPZY5oe2crq+BNmGyPe2FSPeKPwGBOw9A7UlIEgJIrbNaAA+FC9b5G1MD
	StKsEdM825AMROOA3TLNKfBB1u2Wk2/umNkBB9AyRAHQf0VhdMYaPAq67YEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784033719; x=1784120119; bh=Cnw8sbx597bdXAnRBLys9D1D7esLSj3ODge
	5snKZ+4k=; b=db6JE6j9+QSEXwVImczELeB8dHt3Szj/jTKIX6WH/6yvUbpCMqd
	Ga9vQfe/st0xRswP4lyMSkBIkQd4TZskuXQ0ZMhakc5UsmsKVJ5AkRP9aOpUXuLT
	F98PUbIFg8G0iqAxTIcsgHaRWe2GXmK+AHMS4mZ99BCJdMYtElkyd/zkfCQlRUo0
	xasvgmgFLbbDq+iIIuG9r5oDndF5ry/YFH1dEdOCx1TVSRJIryOowQmAg3Dfi9bn
	B8pp/Gp0Iicoj++3mbFd9lLkYGcxw0Y17+SM0Zb/POFweM/RQUrNMHkj8+Yqlosg
	CZl6b89qvtaaGiFHgg2/xbcHNjXjEUC5A4Q==
X-ME-Sender: <xms:tzFWaumGN9_ltXbMPcvHo2m2xflc2uf0VZZzwGQeJbHcDspC8sPRbg>
    <xme:tzFWaiNHhpv0JERWfsxw6Y8Pc4ZHdF-cUmZk2ayyswR84lz4Gvhq_tAA0UjYve1uP
    fhY3bMQ31KwJH6GSHhaimiXnjRcUKH44p8tHb63o9aJ5nDk>
X-ME-Received: <xmr:tzFWahFNFQ2AYyDEdtHThmzS20eUlIj4a_fiDkU9zp_IuZnjH5EQCoWU4bPo7eeQG6QS8oFH1CXgieeepZaNKFJfXA>
X-ME-Proxy-Cause: dmFkZTGZQ54UW1VIwlKcwimdK1aXoEPbp5o2dX+eJXPeHPgSEsld9gnagD/ln2pwf4QLN5
    6uPuCcwNAeZOnvOBAvEaneJ+XFu9F4nWB134eALVl8xafsNPwIcrWATcAp7O/fPY6S6QEF
    UhVzS3AMTiO2qTl3WJl8JsIHFTHcl32iDlG80s9eVsxwMIM25IpXqcovks21ZuU/5eJ/yk
    KstGj2KWSIUfQXzc/qZGLV+jE3T2iqN368swNiWnzhPRnqfI67U1ZRtV5vz+/v+y8TRRXO
    hWFtPRnwnSyxSchCQFtWYyi8atiTddSmrfb02cKBNhJZTM0UY/GygMRS7x8wvoiS7f7/IC
    CIaaNAoBYvNCVqnfLGjLQxBCLDNxKualeRiK1I8En1OIIhnnpaPCmepulGXvaOlpBdZ0tY
    fJpWov0C9Af+aZ3c4MqY3TBtcPx9RZNhYyQwYTIF3NH6A1p7Q1/F0MmftTamaUgVf2JLXy
    K8Lca047fA2lcG4XJ0sZmO5m+HVQOWFiycp+eIVpAmzOURDG/N8CwXd1kAJDWWnkuf4avE
    Xebbe1vPT77y2yDJGiHDjpuvbjkefPDYNe7XC7BaDaf5cKc5q6FtJIdqi1n7ODnQWhp6B2
    JvTyuQHGgpmEC+ehy2TewdSjsOjvmu3OgI+B74hnUqPez2T44ZL8fHs3xZcA
X-ME-Proxy: <xmx:tzFWagsrMAbezWraLmkJWQz28ERgu32dvikdxTCDPXZ9tZeN3JP7OA>
    <xmx:tzFWapTVGM62gUX77anBGQ_yXf2rmuuWaWNZVsEB_txOBOrTMkSWcw>
    <xmx:tzFWaiMMTWhCr66p_Bv8BHgvPXp5RUDt4LjbYxyIwfXQXSnnFXUmEQ>
    <xmx:tzFWav6hJMB03eyu3rRLZaK4H_Rb5U0M6xg95ffaO_y1R7Og70YM1A>
    <xmx:tzFWaqj_JHZNHh7l-dFjrx-NZSK_qQwAzWzkCZSUspHNJP8YiR8nsfMP>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jul 2026 08:55:19 -0400 (EDT)
Date: Tue, 14 Jul 2026 14:55:14 +0200
From: Greg KH <greg@kroah.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Keshav Verma <iganschel@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the char-misc tree with the origin
 tree
Message-ID: <2026071439-magnify-submersed-b5c0@gregkh>
References: <alTxRkflyqvAaGc-@sirena.org.uk>
 <alYvsW4eRWsA46YU@google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alYvsW4eRWsA46YU@google.com>

On Tue, Jul 14, 2026 at 12:46:41PM +0000, Alice Ryhl wrote:
> On Mon, Jul 13, 2026 at 03:08:06PM +0100, Mark Brown wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the char-misc tree got conflicts in:
> > 
> >   drivers/android/binder/node.rs
> >   drivers/android/binder/process.rs
> > 
> > between commits:
> > 
> >   6849cabfd30fb ("rust_binder: reject context manager self-transaction")
> >   bc4a982889787 ("rust_binder: clear freeze listener on node removal")
> > 
> > from the origin tree and commits:
> > 
> >   b9d17aa74ddd7 ("rust_binder: avoid allocating under node_refs for freeze listeners")
> >   521eae8326a18 ("rust_binder: avoid dropping NodeRef in update_ref() under lock")
> > 
> > from the char-misc tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> > I am really not at all confident in this merge.
> 
> Thanks for giving it a shot! I have a slightly different resolution
> since some lines added by commit bc4a98288978 ("rust_binder: clear
> freeze listener on node removal") need to be kept.
> 
> Please see below for the diff between my resolution and yours.
> 
> Alice
> 
> 
> 
> $ git diff linux-next/master drivers/android/binder
> diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
> index c5f745c85a02..0555c4bd503e 100644
> --- a/drivers/android/binder/process.rs
> +++ b/drivers/android/binder/process.rs
> @@ -954,6 +954,8 @@ pub(crate) fn update_ref(
>          // increment references on itself.
>          let _to_free_by_handle;
>          let _to_free_by_node;
> +        let _to_free_freeze_listener;
> +        let _to_free_freeze_listener_cleanup;
>          let mut refs = self.node_refs.lock();
>          if let Some(info) = refs.by_handle.get_mut(&handle) {
>              if info.node_ref().update(inc, strong) {
> @@ -971,6 +973,14 @@ pub(crate) fn update_ref(
>                  unsafe { info.node_ref2().node.remove_node_info(info) };
>  
>                  let id = info.node_ref().node.global_id();
> +
> +                if let Some(freeze) = *info.freeze() {
> +                    if let Some(fl) = refs.freeze_listeners.remove(&freeze) {
> +                        _to_free_freeze_listener_cleanup = fl.on_process_cleanup(&self);
> +                        _to_free_freeze_listener = fl;
> +                    }
> +                }
> +
>                  _to_free_by_handle = refs.by_handle.remove_node(&handle);
>                  _to_free_by_node = refs.by_node.remove_node(&id);
>                  refs.handle_is_present.release_id(handle as usize);
> 


That's a diff between the two, can someone provide me with the diff I
should make now to the tree when I merge these branches together?

thanks,

greg k-h
