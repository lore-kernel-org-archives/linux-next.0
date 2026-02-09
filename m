Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043FE3101D4;
	Mon,  9 Feb 2026 23:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770679057; cv=none; b=CluBIQ/fUiKB0NMVttWqz9R2bGiF7RdbFl7cDRzAPTdD9P9RlH1EVRDT8kNhYyjBZmQ0xVF7HX396Esdm7oiScb6GYj0+47h+ejfYIPkO/6gkkJhDXnDjtriYNU4FOPUR6JaqkBOcgfRaKrWdLO6OgbGcvXtPnGpA5Y6VNrA3Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770679057; c=relaxed/simple;
	bh=TxF8leGiY7OsKX65rsbqY0pCaI1Ec8f8XBTGZ8ZwvuQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=c9IU51Mbwl+Qasey+3OkPMml0MOBpKq3pAPAATBYHvgPjiEDeQs/RUI0raw2NTyT0QJCtltQTKFCct72v7CqRX1oZ6o5e3xYEi31visMyFbvni3dCeKqUEX+O5JG1GiSRoWnER0lsL7/r6R0rSkm+4ukKoNw8mJbw9caKQb4taU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AtTnySvc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AtTnySvc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34F47C116C6;
	Mon,  9 Feb 2026 23:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770679056;
	bh=TxF8leGiY7OsKX65rsbqY0pCaI1Ec8f8XBTGZ8ZwvuQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AtTnySvc55/cYEL2PNPBEGuYP7erNPsz5kGG94FsqMpIpS45vLDyuQqBv+iP+DVW4
	 hMjayrilcRBtyt41XafIxbKeeoiy53C58aFCkcunQePaM7cTX8NW3dWCB6D9loFe2e
	 sUvHWIzXBqfyf9GwfdDhNoFGCTuDHjdZAWW4LMtQfy9FDMdrIQQM1F1wWTZJ28q5Kn
	 raGLRxqelwi5pLkEaQQjOgT7PTWBp4nkbuOEYvBlfXCkCD6Gjw9eNpe+7bQ5A65PjD
	 XXruJkcnkwB+vlIjE8tYkudSvF3cTPwjA0WxTv49DZTOB2Wdl8cNtrS0Q64nQMdiVy
	 TJm6N+GJE5vIQ==
Date: Mon, 9 Feb 2026 16:17:32 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Mark Brown <broonie@kernel.org>
cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>, 
    linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the risc-v tree
In-Reply-To: <aXtDEPQY8E9Fmsov@sirena.org.uk>
Message-ID: <37072dda-06c1-9b33-a0be-9e82a696d746@kernel.org>
References: <aXtDEPQY8E9Fmsov@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 29 Jan 2026, Mark Brown wrote:

> Commit
> 
>   49d90f9626934 ("riscv: ptrace: return ENODATA for inactive vector extension")
> 
> is missing a Signed-off-by from its committer

Thanks, this has been fixed now.

Sorry for the delay,

- Paul
