Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705768;
	b=cwk/Hr2ALKt4seCZTUTh2OUvd5Std7Gvdvu7tc3Ptd4omJOpaIW0WkaKtOEnNW1ReWnf
	 v2HKp3wT/w84TUUytrxeIDeYDf9wdXEoCy6j/hEGWGCUSNHHDpshMi3fO4VetafdH2IrT
	 5FYkGhwPoxRtb8h44xAQJPeR8KhymRj4uddhOFIdA+ELBU0h0zuZsujTOkJc2++kjRxp4
	 0X3xkJpO/2B+sI+u23klJ3K1d1eJctimFk3rfqLt45j0GjnjzkbxOZoeNrn4VBEKIfiII
	 3aawNbusARMJI/L9Qck36VSbqp3KoT6O0ZTI/S98g8zZommEpRfoIQ+NYE16Vg1db7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705768;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aof+ILqdpB8CetuC9z+iOizDzxraoOEhQrsjarvR5DQ=;
	b=eeLDme5VSmiigxQhH8Dc6es0jAIj05rfH44z6iaKI8cVssQ2mCYXqRkBOKpevX+rZgMB
	 8zRGUm3n127LbdY17nltEWNL+1Wfkmxa2ZfKf6Cf08B+fldSisNrn1oq0rdk4ldQj57Nz
	 +MSMVEs9d3N+aQUMsreh5+ZEbpGjirYMgqBGMrKK5AZVMhTvaHh44yyhiwRPCH2l/0jnS
	 S8AlRvoZU4Z8GnCN4IWNxyIt9mZjhpHpuU8ZlS3zv1kWqDw25fxo093pboTs64OZ5tP8r
	 BTQz4NsShg056UrEg97F4BId2xjeoHoSsQbNidFWERCetfxtliMpYgvIjTyeWAsL6kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=akQIzTEv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20B8606A330;
	Thu, 26 Nov 2026 15:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=akQIzTEv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E021F000E6;
	Thu, 26 Nov 2026 15:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795705768;
	bh=aof+ILqdpB8CetuC9z+iOizDzxraoOEhQrsjarvR5DQ=;
	h=From:To:Cc:Subject:Date;
	b=akQIzTEv8gJu11kmhXNmWP0ovWHNasY0SuazGW12ehvAEnl5NSHvWrhl3hDYvzDVE
	 r2Xn7JOJbhj25hZJ192pYMa4FN7dcSeIeX+VLyIIJxAKTiKobM+tZ1PCD2ADgKZz/U
	 6PvCICCMrPY7sJ8q+2xHAyCwnv2oJPAfYN3FRRHDHJeZeOdUASQQilSah4IlJpkAoZ
	 ubFW20CV+cqiPY9aHugwXL5G1JhejI8neUCvWCj/Vfrzg33cjAkh0UEuIfJ094DQX5
	 9LwHFA2SudQiYsYWt77LqLgJF4Pu+d3TVTSeXE4KfAAJ+7owREnbREHkrh4RLkwhdE
	 YZNem/42ix10Q==
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Please add the agents tree to linux-next
Date: Thu, 26 Nov 2026 10:09:25 -0500
Message-ID: <20261126150925.2347325-2-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Mark,

Could you please add the following branch to linux-next:

  https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git agents

It contains the agent skills series, which I intend to send to Linus.

--
Thanks,
Sasha
