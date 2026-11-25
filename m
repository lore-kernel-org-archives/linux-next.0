Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631097;
	b=OvghjofO7WsasVgpQZ+CAhNcthDEZNqSt4zPgEWILtrW7E0He35M9uQicwBWR4e54yod
	 7bOg31RltY1Yh3QKFAgRplatxsq/t3TTIu0rUGbh18MEbwEiQPZAx9GMIszHhS6xFQz/5
	 sFk3Ox/OnW6A7HyrXy3n83apPeA1ZGLCDpvC7wse+ddfNphCJpd14UcJ8AdixUUub9SRF
	 LX7jQV0tOEW0bFP6iIdz/Hw3RbW5hXKW07diKZ2Oopt+5Aw4F9z8xuRNOFmvU/s36EAFh
	 /iYexOXmT8apYkvKamA94TSqHZ0kNEjML+Fy75tyfvpp3KLi5kS03edQKRF3bDG1Yhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631097;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=LG9XCz7azawPhWg+QQVh9bBp4o6iEr0qumgKbOv0+j4=;
	b=dpSwbqRK+uoblxeBjdb50oFk0jBEvDTs40vFv7FlJUn/Z6m/xmeSPH0KuJIAvh7NSZVu
	 ReDwp3cuJcawaTBXdoq6h/EQ2bRle2NIPCqYvrXsQ1I99HoQZVehgjbFzXCRVUtubY6Mq
	 FGYizVxUaq+FPhZ+TUoPP/l98GCxINAx3fucHk0bqIbijwHA0+TzNCCfUgYANfDs8N4Iq
	 AuhWlZ2R0OK/ErERcuKZwvsRiHHAtfGo8SENcWm9ZFKZdpibRKkGyGi7CchLVAjcTJpwC
	 jlWM/fD4FGvYfwzAhQJzGfFzD94w4DULPdhp03Ov2emPGpmgOBvOK+nuNRvSyKOxNTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=iL4kgyQs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8147606A31E;
	Wed, 25 Nov 2026 18:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=iL4kgyQs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A711F000C6;
	Wed, 25 Nov 2026 18:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1795631097;
	bh=LG9XCz7azawPhWg+QQVh9bBp4o6iEr0qumgKbOv0+j4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=iL4kgyQsk4toyE7TwA08W+3H7Jb9+dd+o6vNDgsBcSgjC6aCGCDVlkL9Eyn+UEbZ6
	 fbmT2bxcGBNrjfm1W87yMOA58lafxZyTuLcn7SFiEbVGscNgMdjGdohX9GNOJjjost
	 ofgSkpiNfLFfnfw7o3vQZO9Xz/1CtjthBlU6qXGk=
Date: Wed, 25 Nov 2026 10:24:56 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the fs-next tree with the
 mm-nonmm-unstable tree
Message-Id: <20261125102456.55ef4a88038986ff22f6e24b@linux-foundation.org>
In-Reply-To: <awbxs-lc28R6_cWv@sirena.org.uk>
References: <awbxs-lc28R6_cWv@sirena.org.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 25 Nov 2026 14:33:23 +0000 Mark Brown <broonie@kernel.org> wrote:

> Hi all,
> 
> Today's linux-next merge of the fs-next tree got a conflict in:
> 
>   fs/proc/internal.h
> 
> between commit:
> 
>   262ae352515b6 ("proc: don't lock task inodes whose owner has not changed")
> 
> from the mm-nonmm-unstable tree and commit:
> 
>   6819e45d237d1 ("proc: add helpers for files that outlive an execve()")
> 
> from the fs-next tree.

OK, thanks.  I'll disable "proc: serialize task owner lookup and inode
updates" and "proc: don't lock task inodes whose owner has not
changed".

They're good patches!  But the bug has been there for at least seven
years - I'll get back onto this in the next cycle.

