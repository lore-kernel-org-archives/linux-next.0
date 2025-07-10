Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC3D1DDD1;
	Thu, 10 Jul 2025 22:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752186618; cv=none; b=DStGQymUtG0OZufX+6V669cXHMAfDyjrRFKxS537JO2wembpapRre0+2BJZe+gKQAzFI0/zIOHTqfqqraZsvn6oN8Z7TPCEw6MsbHrdB80BBTZrzNvbS+sCG3lrFK+JpsT2SYzms/GZcapuwF1JLoLWFQaFbp73ZWTC4My8lCxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752186618; c=relaxed/simple;
	bh=ek1erb7vbUdIvcJ4C1KbPFVIhrxIXNfZkgblEP1rQA8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Dv83hV7cppXK8w0p5oQ4atO7uZWZSTDPyqfHoTLuMQzgFHVhrjWJeXLnxYMkA7iqHy/y/BwwhdWNb+yw7jbKUFRPAIaS1kpO8752OdjYtPlS8rhFQkFLfxQRDCgW8oRQBzUOoG6jOA1155cq6WbC0BPIetAx3u1jqnnxMbG5SgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PxU9dePC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PxU9dePC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34ED6C4CEE3;
	Thu, 10 Jul 2025 22:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1752186618;
	bh=ek1erb7vbUdIvcJ4C1KbPFVIhrxIXNfZkgblEP1rQA8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PxU9dePCH2+oMhfn5JzBdoQNSjP5dTcVDR2zI//5hgRPktM/qLRrdaFUB31zlATYo
	 00va+CC66PTAJPyCjL+URv19GsoBZZyHfpst4g68tNJXHaThFBe90t2v1lDZpPFQpY
	 m3KWmewx3BmvYqcE6TA+G8g16e1T3Xa4oW6aK2Rk=
Date: Thu, 10 Jul 2025 15:30:17 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Hildenbrand <david@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the mm-unstable tree
Message-Id: <20250710153017.c17ca59f1df36eec90db8b54@linux-foundation.org>
In-Reply-To: <20250710175446.128c7def@canb.auug.org.au>
References: <20250710175446.128c7def@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Jul 2025 17:54:46 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the mm-unstable tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> mm/migrate.c:215: warning: Function parameter or struct member 'dst' not described in 'migrate_movable_ops_page'
> mm/migrate.c:215: warning: Function parameter or struct member 'src' not described in 'migrate_movable_ops_page'
> mm/migrate.c:215: warning: Function parameter or struct member 'mode' not described in 'migrate_movable_ops_page'
> mm/migrate.c:215: warning: Excess function parameter 'page' description in 'migrate_movable_ops_page'
> 
> Introduced by commit
> 
>   d5967fb0bf8e ("mm/migrate: factor out movable_ops page handling into migrate_movable_ops_page()")

How about this?

--- a/mm/migrate.c~mm-migrate-factor-out-movable_ops-page-handling-into-migrate_movable_ops_page-fix
+++ a/mm/migrate.c
@@ -161,7 +161,9 @@ static void putback_movable_ops_page(str
 
 /**
  * migrate_movable_ops_page - migrate an isolated movable_ops page
- * @page: The isolated page.
+ * @dst: The destination page.
+ * @src: The source page.
+ * @mode: The migration mode.
  *
  * Migrate an isolated movable_ops page.
  *
_

