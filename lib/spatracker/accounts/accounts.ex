defmodule Spatracker.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Spatracker.Repo

  alias Spatracker.Accounts.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias Spatracker.Accounts.Manage

  @doc """
  Returns the list of manages.

  ## Examples

      iex> list_manages()
      [%Manage{}, ...]

  """
  def list_manages do
    Repo.all(Manage)
  end

  @doc """
  Gets a single manage.

  Raises `Ecto.NoResultsError` if the Manage does not exist.

  ## Examples

      iex> get_manage!(123)
      %Manage{}

      iex> get_manage!(456)
      ** (Ecto.NoResultsError)

  """
  def get_manage!(id), do: Repo.get!(Manage, id)

  @doc """
  Creates a manage.

  ## Examples

      iex> create_manage(%{field: value})
      {:ok, %Manage{}}

      iex> create_manage(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_manage(attrs \\ %{}) do
    %Manage{}
    |> Manage.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a manage.

  ## Examples

      iex> update_manage(manage, %{field: new_value})
      {:ok, %Manage{}}

      iex> update_manage(manage, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_manage(%Manage{} = manage, attrs) do
    manage
    |> Manage.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Manage.

  ## Examples

      iex> delete_manage(manage)
      {:ok, %Manage{}}

      iex> delete_manage(manage)
      {:error, %Ecto.Changeset{}}

  """
  def delete_manage(%Manage{} = manage) do
    Repo.delete(manage)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking manage changes.

  ## Examples

      iex> change_manage(manage)
      %Ecto.Changeset{source: %Manage{}}

  """
  def change_manage(%Manage{} = manage) do
    Manage.changeset(manage, %{})
  end

  alias Spatracker.Accounts.Time_Blocks

  @doc """
  Returns the list of time_blocks.

  ## Examples

      iex> list_time_blocks()
      [%Time_Blocks{}, ...]

  """
  def list_time_blocks do
    Repo.all(Time_Blocks)
  end

  @doc """
  Gets a single time__blocks.

  Raises `Ecto.NoResultsError` if the Time  blocks does not exist.

  ## Examples

      iex> get_time__blocks!(123)
      %Time_Blocks{}

      iex> get_time__blocks!(456)
      ** (Ecto.NoResultsError)

  """
  def get_time__blocks!(id), do: Repo.get!(Time_Blocks, id)

  @doc """
  Creates a time__blocks.

  ## Examples

      iex> create_time__blocks(%{field: value})
      {:ok, %Time_Blocks{}}

      iex> create_time__blocks(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_time__blocks(attrs \\ %{}) do
    %Time_Blocks{}
    |> Time_Blocks.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a time__blocks.

  ## Examples

      iex> update_time__blocks(time__blocks, %{field: new_value})
      {:ok, %Time_Blocks{}}

      iex> update_time__blocks(time__blocks, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_time__blocks(%Time_Blocks{} = time__blocks, attrs) do
    time__blocks
    |> Time_Blocks.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Time_Blocks.

  ## Examples

      iex> delete_time__blocks(time__blocks)
      {:ok, %Time_Blocks{}}

      iex> delete_time__blocks(time__blocks)
      {:error, %Ecto.Changeset{}}

  """
  def delete_time__blocks(%Time_Blocks{} = time__blocks) do
    Repo.delete(time__blocks)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking time__blocks changes.

  ## Examples

      iex> change_time__blocks(time__blocks)
      %Ecto.Changeset{source: %Time_Blocks{}}

  """
  def change_time__blocks(%Time_Blocks{} = time__blocks) do
    Time_Blocks.changeset(time__blocks, %{})
  end
end
