Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4750F1B87C9;
	Mon, 27 Jul 2026 12:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785154710; cv=none; b=tr9rljpeSPz1hLv6icnrfVf7JqoWLMxMQdCXF0c1LXKzFc7LdcotM/GP1PGlRFAqjVpquyO0WKgYM/70Z/N2WFB2UrRnRfrd8zkLc70RXNFCfC2JH+OWT7qQMAAq99HtvyetTLdh4gnoUBTwRyf5EXNfqxQ5T4V68diIow1ot3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785154710; c=relaxed/simple;
	bh=5kG9hGDNeDvcS8ocbKNSzgQDn73+1zpx1C6Lb7TogHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C5J/UDNspbi4uxOk93re1SX3Wt8xWPdW6e7C7nJ6xr87rrzrBzosMyHQt27jePB2sy31F8Tzi+noDigpVLAbV48Y5YxqAqlTRPJQS7mt2Lfot8wbPXIPCZFSBmdEmDLM4qdtoBINu3njzSBZrLRCtr2/yWVdb7cXkvxOGSbI8jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=RKGhPL2r; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dJOmKrBl; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="RKGhPL2r";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dJOmKrBl"
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 56A71EC016E;
	Mon, 27 Jul 2026 08:18:27 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Mon, 27 Jul 2026 08:18:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1785154707; x=1785241107; bh=051J8KYpi2
	Hjleq048xfHL9y92bEPlSlCIpqHl0BUl0=; b=RKGhPL2rPd0a+IZMVul4XJwuce
	n7zn3x1ARh5xUvKhEPR2mcB2mBOhy3F0bs9UidtHE2NHaX1cQM0/utLnUMqk5Cxz
	20Ft89w7CybNDQ6mLlU+JghNZl+C1lqjAD2FHf0Ro1463ibLbaKreCGchxvbQ4pr
	tN84i1FLC1OJyfbxYKmInR6s9GTfeZmbz1BMNpfrgdAlM6wnSGN7FVEn9F0Ay8nr
	ocvztalytuuZfFwGjXW0kxqRHyVF31yBhyt51WX2xeIvVz3LwCi7ULew6kwyV8aV
	GmhIWauEmqyjMKaFt4UYGTrPcne4zkExDoJcH9yN0c5Yn4O1+I077h0AsKaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1785154707; x=1785241107; bh=051J8KYpi2Hjleq048xfHL9y92bEPlSlCIp
	qHl0BUl0=; b=dJOmKrBlwXDmRIgTOGh8FqZp5YsQErBeAsTZFjiNwoH/zl/kx8C
	/Bf7CIjNRW4+4ZDerzv5OjUiewyHqyKEie2CFX/FxkbCEnYw23BX+dcIk3oydiM3
	BkJ1VUEmuWejaB/m595K4FbfQvtRtWSsY7TJAJH0Xz0IgT0yP6/zbndFiCDpxqwC
	YBw+/sqlOc6m+v1OxtBMkTICqi+Xoir75DzrqSF6tIdWjSvq6c2EvD+thrM9tcy8
	iV0I00mmBbORuc0JrUvvySS5uX+arYV7vY0RUc2ezpXt5C8qlivnY5nJTUcn6lNv
	ai0L7L6cb5elFne21hZzPkExePND6PP7YSQ==
X-ME-Sender: <xms:kkxnanplXX9__qgn7N0ilPjHyHuCjKeoIvyNWkl-GwHSCIc0T7KYqQ>
    <xme:kkxnaoBP0s6F2NfCDmSI3zJ_vg4jvXR21Zin9punTeoYIDs8kJH7qKMAzO1E19i1s
    tNuWI_Wh_Eg-WHaU95hd3gsbWJDPtByhZEeZjgGlSBtkYgWUg>
X-ME-Received: <xmr:kkxnagf76MmMcMW1KPlEkeaVcRiLxcMd4nn-fgoFACOI3K4hWNBgMKlRpiBZmK5rZN-AZNlPMRs9PJwYE8oq8xv_Mw>
X-ME-Proxy-Cause: dmFkZTEscXvekO+kWICadqRkLQdOcuIB4jah5CLAFrrcY8eyJc/38qzmYQPIkHKO5UmTUY
    ZD0X+Bz79fVHbVyZj2SUmf1JgstDhg8kD2/9e8FmwkDjY+l0A71jrBwpubAbIUXS5QnNkj
    ygA98nJumeTv6pUfWjwyi/oGbJILfFJGRgS6QtnhXBQl9Wc3BKwbBl7nISQ4ifpKcRFdb+
    nEFet/JXT8579DqwGibCj84vd2RYj5ff/ukieVdWbErn46DV3Idf1+r6wNSZd6TRfuvOLo
    iEierFIVz2lzsSu2MbCwhZwEEjRmFR1noRmyh6xo74KzGVXL013l6aIjc35P56Vft/mUJw
    hyTAUZL91J3eUNYUKonnN+1Va9LEsY2cPOiR32ZHddoqAEeaoxmwp8w0+LZCIVdFcRIKI3
    UAxsFfioWDlD9zP2XAAX18cJt8Q+4egb2mh32NCMiTofq/zK5ObU3VEIhFl5ltEH9FQVYH
    QRDviZe9ftMXdkqoZ/keMB8Z3s7TMabAP4Xno8dY5lOIMkcp9/ApHtughQussPRvOztrRI
    g006SFmfGcxCKPx9VGKh+J1Oguy3B2Cu+FRKXkwBwMCmDI4MICpwkSJocSAQoU9uohbsnD
    KUOcQreJHMRHOFKzAC8QtMQhVu54pGMguSKdRbO7WU3b6ADvtdb0R1gmlCXg
X-ME-Proxy: <xmx:kkxnaovLnCsFcACZxqigMUjl2kk0D0uksr6_-nAskzlJXYC6iKKvIw>
    <xmx:k0xnaviWrzd-kKXnQK6cpGrYUqW-r_2Zowir9Nv6kSGXldfeUTKPMQ>
    <xmx:k0xnaotjsMG8n1GWS5_5o4t1qzeM966FuZCjOGAmtIyyt2476Sc-CA>
    <xmx:k0xnai8nm7m2CuXcjeDUT_7V6IaeMo-kugPwwowIziHwzymh11ObcA>
    <xmx:k0xnasL-ggjAwMqDejVXedToM8qJ19QwaWJqOpbl0d4T_Kb_uPwXJpp1>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Jul 2026 08:18:26 -0400 (EDT)
Date: Mon, 27 Jul 2026 14:18:15 +0200
From: Greg KH <greg@kroah.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Jahnavi MN <jahnavimn@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the char-misc tree with the
 char-misc.current tree
Message-ID: <2026072736-handclasp-bubbly-c879@gregkh>
References: <al40WiyRukYGQ68S@sirena.org.uk>
 <al8tlTE4KgeZ92PQ@google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al8tlTE4KgeZ92PQ@google.com>

On Tue, Jul 21, 2026 at 08:28:05AM +0000, Alice Ryhl wrote:
> On Mon, Jul 20, 2026 at 03:44:42PM +0100, Mark Brown wrote:
> > Hi all,
> >
> > Today's linux-next merge of the char-misc tree got a conflict in:
> >
> >   drivers/android/binder/thread.rs
> >
> > between commit:
> >
> >   bb66b1a345253 ("rust_binder: only print failure if error has source")
> >
> > from the char-misc.current tree and commit:
> >
> >   c61f3ad2213cf ("rust_binder: Implement BINDER_DEBUG_FAILED_TRANSACTION")
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
> > diff --cc drivers/android/binder/thread.rs
> > index bc0ef8927905c,a51821dde0adf..0000000000000
> > --- a/drivers/android/binder/thread.rs
> > +++ b/drivers/android/binder/thread.rs
> > @@@ -1273,14 -1295,25 +1295,24 @@@ impl Thread
> >                           inner.extended_error =
> >                               ExtendedError::new(info.debug_id as u32, err.reply, source.to_errno());
> >                       }
> >  -                }
> >
> > -                     pr_warn!(
> > -                         "{}:{} transaction to {} failed: {err:?}",
> > -                         info.from_pid,
> > -                         info.from_tid,
> > -                         info.to_pid
> >  -                binder_debug!(
> >  -                    FailedTransaction,
> >  -                    "transaction {} to {}:{} failed {:?}, code {} size {}-{}",
> >  -                    if info.is_reply {
> >  -                        "reply"
> >  -                    } else if info.is_oneway() {
> >  -                        "async"
> >  -                    } else {
> >  -                        "call"
> >  -                    },
> >  -                    info.to_pid,
> >  -                    info.to_tid,
> >  -                    err,
> >  -                    info.code,
> >  -                    info.data_size,
> >  -                    info.offsets_size
> >  -                );
> > ++                    binder_debug!(
> > ++                        FailedTransaction,
> > ++                        "transaction {} to {}:{} failed {:?}, code {} size {}-{}",
> > ++                        if info.is_reply {
> > ++                            "reply"
> > ++                        } else if info.is_oneway() {
> > ++                            "async"
> > ++                        } else {
> > ++                            "call"
> > ++                        },
> > ++                        info.to_pid,
> > ++                        info.to_tid,
> > ++                        err,
> > ++                        info.code,
> > ++                        info.data_size,
> > ++                        info.offsets_size
> >  +                    );
> > -                 }
> >               }
> >           }
> 
> I think you're missing a closing } after the binder_debug! call.
> Otherwise LGTM.
> 
> error: this file contains an unclosed delimiter
>     --> drivers/android/binder/thread.rs:1743:3
>      |
> 453  | impl Thread {
>      |             - unclosed delimiter
> ...
> 1290 |                 if let Some(source) = &err.source {
>      |                                                   - this delimiter might not be properly closed...
> ...
> 1316 |             }
>      |             - ...as it matches this but it has different indentation
> ...
> 1743 | }
>      |  ^
> 
> error: aborting due to 1 previous error

That trailing ) on the same indent line just looks odd to me, which is
why I can see it's going to be easy to make this type of merge
mistake...

I've done this now in my tree so all should be good going forward,
thanks!

greg k-h
